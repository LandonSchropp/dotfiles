# frozen_string_literal: true

require "json"
require "open3"
require "tempfile"
require "tmpdir"

describe "stamp-screenshots" do
  subject(:result) { run_script }

  let(:script_path) do
    File.expand_path("../../local/share/screenshots/stamp-screenshots.rb", __dir__)
  end

  let(:attribute) { "com.apple.LaunchServices.OpenWith" }
  let(:cache_home) { nil }

  around do |example|
    Dir.mktmpdir do |directory|
      @home = directory
      example.run
    end
  end

  before { Dir.mkdir(screenshots_directory) }

  def screenshots_directory
    File.join(@home, "Screenshots")
  end

  def marker_path
    File.join(@home, ".cache", "stamp-screenshots", "marker")
  end

  def create_screenshot(name)
    path = File.join(screenshots_directory, name)
    File.write(path, "not really an image")
    path
  end

  def write_handler(path, bundle_identifier)
    plist = <<~XML
      <?xml version="1.0" encoding="UTF-8"?>
      <plist version="1.0">
        <dict>
          <key>version</key><integer>0</integer>
          <key>path</key><string>/Applications/Preview.app</string>
          <key>bundleidentifier</key><string>#{bundle_identifier}</string>
        </dict>
      </plist>
    XML

    binary, _, _status = Open3.capture3("plutil", "-convert", "binary1", "-o", "-", "-",
      stdin_data: plist)

    Open3.capture3("xattr", "-w", "-x", attribute, binary.unpack1("H*"), path)
  end

  def handler(path)
    hexadecimal, _, status = Open3.capture3("xattr", "-p", "-x", attribute, path)
    return nil unless status.success?

    Tempfile.create("handler") do |file|
      file.binmode
      file.write([hexadecimal.gsub(/\s/, "")].pack("H*"))
      file.close

      JSON.parse(Open3.capture3("plutil", "-convert", "json", "-o", "-", file.path).first)
    end
  end

  def run_script
    Open3.capture3({ "HOME" => @home, "XDG_CACHE_HOME" => cache_home }, script_path)
  end

  context "when the directory contains an image" do
    let!(:screenshot) { create_screenshot("Screenshot 2026-08-05 at 9.00.00 AM.png") }

    it "points the image at Shottr" do
      result
      expect(handler(screenshot)).to include("bundleidentifier" => "cc.ffitch.shottr")
    end

    it "records Shottr's path" do
      result
      expect(handler(screenshot)).to include("path" => "/Applications/Shottr.app")
    end

    it "succeeds" do
      expect(result.last).to be_success
    end
  end

  context "when the directory contains images of other formats" do
    let!(:jpeg) { create_screenshot("screenshot.jpg") }
    let!(:heic) { create_screenshot("screenshot.heic") }

    it "points the JPEG at Shottr" do
      result
      expect(handler(jpeg)).to include("bundleidentifier" => "cc.ffitch.shottr")
    end

    it "points the HEIC at Shottr" do
      result
      expect(handler(heic)).to include("bundleidentifier" => "cc.ffitch.shottr")
    end
  end

  context "when the script is run through its binstub" do
    let(:script_path) { File.expand_path("../../local/bin/stamp-screenshots", __dir__) }
    let!(:screenshot) { create_screenshot("screenshot.png") }

    it "points the image at Shottr" do
      result
      expect(handler(screenshot)).to include("bundleidentifier" => "cc.ffitch.shottr")
    end
  end

  context "when the image's name contains a newline" do
    let!(:screenshot) { create_screenshot("weird\nname.png") }

    it "points the image at Shottr" do
      result
      expect(handler(screenshot)).to include("bundleidentifier" => "cc.ffitch.shottr")
    end
  end

  context "when the directory contains a screen recording" do
    let!(:recording) { create_screenshot("Screen Recording 2026-08-05 at 9.00.00 AM.mov") }

    it "leaves the recording alone" do
      result
      expect(handler(recording)).to be_nil
    end
  end

  context "when an image already has a handler" do
    let!(:screenshot) { create_screenshot("screenshot.png") }

    before { write_handler(screenshot, "com.apple.Preview") }

    it "preserves the existing handler" do
      result
      expect(handler(screenshot)).to include("bundleidentifier" => "com.apple.Preview")
    end
  end

  context "when an image predates the last run" do
    let!(:screenshot) { create_screenshot("screenshot.png") }

    before do
      run_script
      Open3.capture3("xattr", "-d", attribute, screenshot)
      File.utime(Time.now - 3600, Time.now - 3600, screenshot)
    end

    it "leaves the image alone" do
      run_script
      expect(handler(screenshot)).to be_nil
    end

    it "still points a newly added image at Shottr" do
      run_script
      added = create_screenshot("added.png")
      run_script

      expect(handler(added)).to include("bundleidentifier" => "cc.ffitch.shottr")
    end
  end

  context "when the image is in a subdirectory" do
    let!(:screenshot) do
      Dir.mkdir(File.join(screenshots_directory, "Archive"))
      create_screenshot("Archive/screenshot.png")
    end

    it "leaves the image alone" do
      result
      expect(handler(screenshot)).to be_nil
    end
  end

  context "when the directory is empty" do
    it "succeeds" do
      expect(result.last).to be_success
    end

    it "creates the marker" do
      result
      expect(File.exist?(marker_path)).to be(true)
    end
  end

  context "when XDG_CACHE_HOME is set" do
    let(:cache_home) { File.join(@home, "cache") }
    let!(:screenshot) { create_screenshot("screenshot.png") }

    it "puts the marker in the cache directory" do
      result
      expect(File.exist?(File.join(cache_home, "stamp-screenshots", "marker"))).to be(true)
    end

    it "points the image at Shottr" do
      result
      expect(handler(screenshot)).to include("bundleidentifier" => "cc.ffitch.shottr")
    end
  end

  context "when XDG_CACHE_HOME is empty" do
    let(:cache_home) { "" }
    let!(:screenshot) { create_screenshot("screenshot.png") }

    it "falls back to the default cache directory" do
      result
      expect(File.exist?(marker_path)).to be(true)
    end

    it "points the image at Shottr" do
      result
      expect(handler(screenshot)).to include("bundleidentifier" => "cc.ffitch.shottr")
    end

    it "succeeds" do
      expect(result.last).to be_success
    end
  end

  context "when the directory does not exist" do
    before { Dir.rmdir(screenshots_directory) }

    it "prints an error" do
      expect(result[1]).to match(/\AError: /)
    end

    it "fails" do
      expect(result.last).not_to be_success
    end
  end
end
