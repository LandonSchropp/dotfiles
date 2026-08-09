# frozen_string_literal: true

require "fileutils"
require "open3"
require "tmpdir"

describe "set-up-rcup" do
  subject(:result) { run_script }

  let(:script_path) { File.expand_path("../bin/set-up-rcup", __dir__) }
  let(:arguments) { [] }

  around do |example|
    Dir.mktmpdir do |directory|
      @home_directory = directory
      example.run
    end
  end

  before do
    # The real rcup creates this while linking, and the Karabiner hack then links into it.
    FileUtils.mkdir_p(File.join(@home_directory, ".config"))

    File.write(rcup_path, <<~SHELL)
      #!/usr/bin/env bash
      printf '%s\\n' "$*" >> "#{calls_path}"
    SHELL

    File.chmod(0o755, rcup_path)
  end

  def rcup_path
    File.join(@home_directory, "rcup")
  end

  def calls_path
    File.join(@home_directory, "rcup-calls")
  end

  # The single rcup invocation, split back into its arguments.
  def rcup_arguments
    return nil unless File.exist?(calls_path)

    File.read(calls_path).chomp.split
  end

  def run_script
    environment = {
      # The script writes into the home directory, so it runs against a throwaway one.
      "HOME" => @home_directory,
      "PATH" => "#{@home_directory}:#{ENV.fetch("PATH")}",
    }

    Open3.capture3(environment, script_path, *arguments)
  end

  let(:flags) { %w[-t personal -v -U Library -x karabiner.json] }

  context "when given no arguments" do
    it "hands rcup every managed path" do
      result
      expect(rcup_arguments).to eq(flags + %w[Library claude config local zprofile zshenv zshrc])
    end

    it "succeeds" do
      expect(result.last).to be_success
    end
  end

  context "when given a managed path" do
    let(:arguments) { ["config/nvim"] }

    it "hands rcup only that path" do
      result
      expect(rcup_arguments).to eq(flags + ["config/nvim"])
    end

    it "succeeds" do
      expect(result.last).to be_success
    end
  end

  context "when the path needs normalizing" do
    let(:arguments) { ["config/./nvim"] }

    it "hands rcup the cleaned path" do
      result
      expect(rcup_arguments).to eq(flags + ["config/nvim"])
    end
  end

  context "when given Karabiner's configuration" do
    let(:arguments) { ["config/karabiner/karabiner.json"] }

    it "tells rcup to exclude it" do
      result
      expect(rcup_arguments).to eq(flags + ["config/karabiner/karabiner.json"])
    end
  end

  context "when given a path under Library" do
    let(:arguments) { ["Library/LaunchAgents"] }

    it "excludes it from dotting" do
      result

      expect(rcup_arguments).to eq(
        %w[-t personal -v -U Library -U Library/LaunchAgents -x karabiner.json
           Library/LaunchAgents],
      )
    end
  end

  context "when given a path it refuses" do
    let(:arguments) { ["Documents"] }

    it "never calls rcup" do
      result
      expect(rcup_arguments).to be_nil
    end

    it "prints an error" do
      expect(result[1]).to match(/\AError: /)
    end

    it "fails" do
      expect(result.last).not_to be_success
    end
  end

  describe "the paths it refuses" do
    {
      "an unmanaged entry" => "bin",
      "an absolute path" => "/etc",
      "a name that merely shares a prefix" => "configuration",
      "parent traversal" => "config/../bin",
      "a bare parent" => "..",
      "a glob that expands to traversal" => "config/.*/bin",
      "a glob" => "config/*",
      "a command substitution" => "config/$(id)",
      "a shell separator" => "config/nvim;id",
    }.each do |description, path|
      context "when given #{description}" do
        let(:arguments) { [path] }

        it "never calls rcup" do
          result
          expect(rcup_arguments).to be_nil
        end
      end
    end
  end
end
