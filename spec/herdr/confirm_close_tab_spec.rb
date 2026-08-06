# frozen_string_literal: true

require "open3"
require "tmpdir"

describe "confirm-close-tab" do
  subject(:result) { run_script }

  let(:script_path) do
    File.expand_path("../../local/share/herdr/confirm-close-tab.sh", __dir__)
  end

  let(:confirmed) { true }
  let(:tab_id) { "w1S:t3" }

  around do |example|
    Dir.mktmpdir do |directory|
      @bin_directory = directory
      example.run
    end
  end

  before do
    write_fake("gum", exit_status: confirmed ? 0 : 1)
    write_fake("herdr")
  end

  def write_fake(name, exit_status: 0)
    path = File.join(@bin_directory, name)

    File.write(path, <<~SHELL)
      #!/usr/bin/env bash
      printf '%s\\n' "$*" >> "#{calls_path(name)}"
      exit #{exit_status}
    SHELL

    File.chmod(0o755, path)
  end

  def calls_path(name)
    File.join(@bin_directory, "#{name}-calls")
  end

  def calls(name)
    return [] unless File.exist?(calls_path(name))

    File.read(calls_path(name)).lines.map(&:chomp)
  end

  def run_script
    environment = {
      "HERDR_TAB_ID" => tab_id,
      "PATH" => "#{@bin_directory}:#{ENV.fetch("PATH")}"
    }

    Open3.capture3(environment, script_path)
  end

  context "when the user confirms" do
    let(:confirmed) { true }

    it "closes the tab" do
      result
      expect(calls("herdr")).to eq(["tab close #{tab_id}"])
    end

    it "succeeds" do
      expect(result.last).to be_success
    end
  end

  context "when the user declines" do
    let(:confirmed) { false }

    it "does not close the tab" do
      result
      expect(calls("herdr")).to be_empty
    end

    it "succeeds" do
      expect(result.last).to be_success
    end
  end

  it "asks for confirmation" do
    result
    expect(calls("gum")).to eq(["confirm Close this tab?"])
  end

  context "when the tab identifier is missing" do
    let(:tab_id) { nil }

    it "does not ask for confirmation" do
      result
      expect(calls("gum")).to be_empty
    end

    it "does not close the tab" do
      result
      expect(calls("herdr")).to be_empty
    end

    it "prints an error" do
      expect(result[1]).to match(/\AError: /)
    end

    it "fails" do
      expect(result.last).not_to be_success
    end
  end
end
