# frozen_string_literal: true

require "fileutils"
require "json"
require "tmpdir"
require_relative "../../local/share/launcher/sync"

describe Sync do
  describe ".call" do
    let(:domain) { LaunchAgent.domain }
    let(:task) do
      Task.new(name: "daily-update", description: "Updates everything", command: "daily-update", cron: "0 7 * * *")
    end
    let(:tasks) { [task] }
    let(:label) { task.label }
    let(:plist_path) { File.join(launch_agents_directory, "#{label}.plist") }

    around do |example|
      Dir.mktmpdir do |directory|
        @launch_agents_directory = File.join(directory, "LaunchAgents")
        @manifest_path = File.join(directory, "managed.json")
        FileUtils.mkdir_p(@launch_agents_directory)
        example.run
      end
    end

    let(:launch_agents_directory) { @launch_agents_directory }
    let(:manifest_path) { @manifest_path }

    before do
      stub_const("Sync::LAUNCH_AGENTS_DIRECTORY", launch_agents_directory)
      stub_const("Sync::MANIFEST_PATH", manifest_path)
      allow(Task).to receive(:all).and_return(tasks)
      allow(described_class).to receive(:system).and_return(true)
    end

    context "when installing a current task" do
      before do
        # Stub the log directory creation.
        allow(FileUtils).to receive(:mkdir_p).and_call_original
        allow(FileUtils).to receive(:mkdir_p).with(%r{Library/Logs})
        described_class.call
      end

      it "boots out any existing agent under the same label first" do
        expect(described_class).to have_received(:system).with(
          "launchctl", "bootout", "#{domain}/#{label}", exception: false
        )
      end

      it "bootstraps the task's agent" do
        expect(described_class).to have_received(:system).with(
          "launchctl", "bootstrap", domain, plist_path, exception: true
        )
      end

      it "converts the generated plist to XML at the task's path" do
        expect(described_class).to have_received(:system).with(
          "plutil", "-convert", "xml1", anything, "-o", plist_path, exception: true
        )
      end

      it "lints the installed plist" do
        expect(described_class).to have_received(:system).with("plutil", "-lint", plist_path, exception: true)
      end

      it "records the label in the manifest" do
        expect(JSON.parse(File.read(manifest_path))).to eq([label])
      end
    end

    context "when a previously managed task is no longer in the config" do
      let(:tasks) { [] }
      let(:removed_label) { "com.landonschropp.old-task" }
      let(:removed_plist_path) { File.join(launch_agents_directory, "#{removed_label}.plist") }

      before do
        File.write(manifest_path, JSON.generate([removed_label]))
        File.write(removed_plist_path, "")
        described_class.call
      end

      it "boots out the removed agent" do
        expect(described_class).to have_received(:system).with(
          "launchctl", "bootout", "#{domain}/#{removed_label}", exception: false
        )
      end

      it "deletes the removed agent's plist file" do
        expect(File.exist?(removed_plist_path)).to be(false)
      end

      it "does not record the removed label in the manifest" do
        expect(JSON.parse(File.read(manifest_path))).to eq([])
      end
    end
  end
end
