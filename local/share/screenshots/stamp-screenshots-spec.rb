# frozen_string_literal: true

require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "rspec", "~> 3.13"
end

require "rspec/autorun"

require "tmpdir"

SCRIPT = File.expand_path("stamp-screenshots.rb", __dir__)

describe "stamp-screenshots" do
  let(:main) { TOPLEVEL_BINDING.receiver }
  let(:script_path) { SCRIPT }
  let(:attribute) { "com.apple.LaunchServices.OpenWith" }
  let(:shottr_handler) { "bplist00".unpack1("H*") }
  let(:conversion) do
    ["plutil", "-convert", "binary1", "-o", "-", File.expand_path("shottr-handler.plist", __dir__)]
  end
  let(:cache_home) { nil }

  around do |example|
    @constants = Object.constants

    Dir.mktmpdir do |directory|
      @home = directory
      example.run
    end
  ensure
    forget_script
  end

  before do
    Dir.mkdir(screenshots_directory)

    allow(Dir).to receive(:home).and_return(@home)
    allow(ENV).to receive(:[]).and_call_original
    allow(ENV).to receive(:[]).with("XDG_CACHE_HOME").and_return(cache_home)
    allow(IO).to receive(:popen).and_return("bplist00")
    allow(main).to receive(:system).and_return(false)
    allow(main).to receive(:system).with("xattr", "-w", any_args).and_return(true)
    allow($stderr).to receive(:write)
  end

  def run_script
    forget_script
    load script_path
  end

  # Removes the constants earlier loads defined, so the next load doesn't redefine them.
  def forget_script
    (Object.constants - @constants).each { Object.send(:remove_const, _1) }
  end

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

  def stamp(path)
    have_received(:system).with("xattr", "-w", "-x", attribute, shottr_handler, path, exception: true)
  end

  context "when the directory contains an image" do
    let!(:screenshot) { create_screenshot("Screenshot 2026-08-05 at 9.00.00 AM.png") }

    it "points the image at Shottr" do
      run_script
      expect(main).to stamp(screenshot)
    end

    it "converts Shottr's handler for xattr" do
      run_script

      expect(IO).to have_received(:popen).with(conversion, "rb")
    end
  end

  context "when the directory contains images of other formats" do
    let!(:jpeg) { create_screenshot("screenshot.jpg") }
    let!(:heic) { create_screenshot("screenshot.heic") }

    it "points the JPEG at Shottr" do
      run_script
      expect(main).to stamp(jpeg)
    end

    it "points the HEIC at Shottr" do
      run_script
      expect(main).to stamp(heic)
    end
  end

  context "when the script is run through its binstub" do
    let(:script_path) { File.expand_path("../../bin/stamp-screenshots", __dir__) }
    let!(:screenshot) { create_screenshot("screenshot.png") }

    it "points the image at Shottr" do
      run_script
      expect(main).to stamp(screenshot)
    end

    it "finds Shottr's handler beside the script" do
      run_script
      expect(IO).to have_received(:popen).with(conversion, "rb")
    end
  end

  context "when the image's name contains a newline" do
    let!(:screenshot) { create_screenshot("weird\nname.png") }

    it "points the image at Shottr" do
      run_script
      expect(main).to stamp(screenshot)
    end
  end

  context "when the directory contains a screen recording" do
    let!(:recording) { create_screenshot("Screen Recording 2026-08-05 at 9.00.00 AM.mov") }

    it "leaves the recording alone" do
      run_script
      expect(main).not_to stamp(recording)
    end
  end

  context "when an image already has a handler" do
    let!(:screenshot) { create_screenshot("screenshot.png") }

    before do
      allow(main).to receive(:system)
        .with("xattr", "-p", attribute, screenshot, out: File::NULL, err: File::NULL)
        .and_return(true)
    end

    it "preserves the existing handler" do
      run_script
      expect(main).not_to stamp(screenshot)
    end
  end

  context "when an image predates the last run" do
    let!(:screenshot) { create_screenshot("screenshot.png") }

    before do
      run_script
      File.utime(Time.now - 3600, Time.now - 3600, screenshot)
    end

    it "leaves the image alone" do
      run_script
      expect(main).to stamp(screenshot).once
    end

    it "still points a newly added image at Shottr" do
      run_script
      added = create_screenshot("added.png")
      run_script

      expect(main).to stamp(added)
    end
  end

  context "when the image is in a subdirectory" do
    let!(:screenshot) do
      Dir.mkdir(File.join(screenshots_directory, "Archive"))
      create_screenshot("Archive/screenshot.png")
    end

    it "leaves the image alone" do
      run_script
      expect(main).not_to stamp(screenshot)
    end
  end

  context "when the directory is empty" do
    it "creates the marker" do
      run_script
      expect(File.exist?(marker_path)).to be(true)
    end
  end

  context "when XDG_CACHE_HOME is set" do
    let(:cache_home) { File.join(@home, "cache") }
    let!(:screenshot) { create_screenshot("screenshot.png") }

    it "puts the marker in the cache directory" do
      run_script
      expect(File.exist?(File.join(cache_home, "stamp-screenshots", "marker"))).to be(true)
    end

    it "points the image at Shottr" do
      run_script
      expect(main).to stamp(screenshot)
    end
  end

  context "when XDG_CACHE_HOME is empty" do
    let(:cache_home) { "" }
    let!(:screenshot) { create_screenshot("screenshot.png") }

    it "falls back to the default cache directory" do
      run_script
      expect(File.exist?(marker_path)).to be(true)
    end

    it "points the image at Shottr" do
      run_script
      expect(main).to stamp(screenshot)
    end
  end

  context "when the directory does not exist" do
    before { Dir.rmdir(screenshots_directory) }

    it "prints an error and fails" do
      expect { run_script }
        .to raise_error(SystemExit) { expect(_1).not_to be_success }
        .and output(/\AError: /).to_stderr
    end
  end
end
