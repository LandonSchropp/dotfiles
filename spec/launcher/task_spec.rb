# frozen_string_literal: true

require "tmpdir"
require_relative "../../local/share/launcher/task"

describe Task do
  describe "#label" do
    let(:task) do
      described_class.new(name: "daily-update", description: "Updates everything", command: "daily-update", cron: "0 7 * * *")
    end

    it "prefixes the task name" do
      expect(task.label).to eq("com.landonschropp.daily-update")
    end
  end

  describe ".all" do
    subject(:tasks) { described_class.all(path: config_path) }

    around do |example|
      Dir.mktmpdir do |directory|
        @config_path = File.join(directory, "tasks.yml")
        example.run
      end
    end

    let(:config_path) { @config_path }

    context "when the config file does not exist" do
      it "returns an empty array" do
        expect(tasks).to eq([])
      end
    end

    context "when the config file is empty" do
      before { File.write(config_path, "") }

      it "returns an empty array" do
        expect(tasks).to eq([])
      end
    end

    context "when the config file has one task" do
      before do
        File.write(config_path, <<~YAML)
          - name: daily-update
            description: Update everything daily
            command: daily-update
            cron: "0 7 * * *"
        YAML
      end

      it "returns a Task built from the entry" do
        expect(tasks).to eq(
          [
            Task.new(
              name: "daily-update",
              description: "Update everything daily",
              command: "daily-update",
              cron: "0 7 * * *"
            )
          ]
        )
      end
    end

    context "when two tasks share a name" do
      before do
        File.write(config_path, <<~YAML)
          - name: daily-update
            description: First
            command: daily-update
            cron: "0 7 * * *"
          - name: daily-update
            description: Second
            command: daily-update
            cron: "0 15 * * *"
        YAML
      end

      it "raises an error" do
        expect { tasks }.to raise_error(ArgumentError, /Duplicate task names: daily-update/)
      end
    end
  end

  describe ".find" do
    subject(:find) { described_class.find(name) }

    let(:task) do
      described_class.new(name: "daily-update", description: "Updates everything", command: "daily-update", cron: "0 7 * * *")
    end

    before { allow(described_class).to receive(:all).and_return([task]) }

    context "when a task with the given name exists" do
      let(:name) { "daily-update" }

      it "returns the task" do
        expect(find).to eq(task)
      end
    end

    context "when no task with the given name exists" do
      let(:name) { "nonexistent" }

      it "raises an error" do
        expect { find }.to raise_error(ArgumentError, "Unknown task: nonexistent")
      end
    end
  end
end
