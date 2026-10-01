# frozen_string_literal: true

require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "rspec", "~> 3.13"
end

require "rspec/autorun"

require "fileutils"
require "socket"
require "tmpdir"

SCRIPT = File.expand_path("set-up-rcup", __dir__)

describe "set-up-rcup" do
  subject(:run_script) do
    stub_const("ARGV", arguments)
    load SCRIPT
  end

  let(:main) { TOPLEVEL_BINDING.receiver }
  let(:arguments) { [] }
  let(:flags) { %w[-t personal -v -U Library -x karabiner.json] }

  # Removes the constants each load defines.
  around do |example|
    constants = Object.constants

    Dir.mktmpdir do |directory|
      @home_directory = directory
      example.run
    end
  ensure
    (Object.constants - constants).each { Object.send(:remove_const, _1) }
  end

  before do
    # Stands in for the directory rcup creates.
    FileUtils.mkdir_p(File.join(@home_directory, ".config"))

    allow(Dir).to receive(:home).and_return(@home_directory)
    allow(Socket).to receive(:gethostname).and_return("Landons-MacBook-Pro.local")
    allow(main).to receive(:system).and_return(true)
    allow($stderr).to receive(:write)
  end

  context "when given no arguments" do
    it "hands rcup every managed path" do
      run_script
      expect(main).to have_received(:system)
        .with("rcup", *flags, *%w[Library claude config local zprofile zshenv zshrc])
    end
  end

  context "when given a managed path" do
    let(:arguments) { ["config/nvim"] }

    it "hands rcup only that path" do
      run_script
      expect(main).to have_received(:system).with("rcup", *flags, "config/nvim")
    end
  end

  context "when the path needs normalizing" do
    let(:arguments) { ["config/./nvim"] }

    it "hands rcup the cleaned path" do
      run_script
      expect(main).to have_received(:system).with("rcup", *flags, "config/nvim")
    end
  end

  context "when given Karabiner's configuration" do
    let(:arguments) { ["config/karabiner/karabiner.json"] }

    it "tells rcup to exclude it" do
      run_script
      expect(main).to have_received(:system).with("rcup", *flags, "config/karabiner/karabiner.json")
    end
  end

  context "when given a path under Library" do
    let(:arguments) { ["Library/LaunchAgents"] }

    it "excludes it from dotting" do
      run_script

      expect(main).to have_received(:system).with(
        "rcup", *%w[-t personal -v -U Library -U Library/LaunchAgents -x karabiner.json Library/LaunchAgents]
      )
    end
  end

  context "when the machine is a work machine" do
    before { allow(Socket).to receive(:gethostname).and_return("OHR-12345.local") }

    it "hands rcup the work tag" do
      run_script
      expect(main).to have_received(:system).with("rcup", "-t", "work", any_args)
    end
  end

  context "when rcup succeeds" do
    it "links Karabiner's configuration directory" do
      run_script

      expect(File.readlink(File.join(@home_directory, ".config", "karabiner")))
        .to eq(File.join(@home_directory, ".dotfiles", "config", "karabiner"))
    end
  end

  context "when rcup fails" do
    before { allow(main).to receive(:system).and_return(false) }

    it "prints an error and fails" do
      expect { run_script }
        .to raise_error(SystemExit) { expect(_1).not_to be_success }
        .and output(/\AError: /).to_stderr
    end
  end

  context "when given a path it refuses" do
    let(:arguments) { ["Documents"] }

    it "never calls rcup" do
      expect { run_script }.to raise_error(SystemExit)
      expect(main).not_to have_received(:system)
    end

    it "prints an error and fails" do
      expect { run_script }
        .to raise_error(SystemExit) { expect(_1).not_to be_success }
        .and output(/\AError: /).to_stderr
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
          expect { run_script }.to raise_error(SystemExit)
          expect(main).not_to have_received(:system)
        end
      end
    end
  end
end
