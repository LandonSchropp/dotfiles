# frozen_string_literal: true

require_relative "../../local/share/launcher/log"

describe Log do
  describe ".call" do
    let(:task) do
      Task.new(name: "daily-update", description: "Updates everything daily", command: "daily-update", cron: "0 7 * * *")
    end
    let(:stdout_path) { File.join(task.log_directory, "stdout.log") }
    let(:stderr_path) { File.join(task.log_directory, "stderr.log") }

    before do
      allow(Task).to receive(:all).and_return([task])
      allow(described_class).to receive(:system).and_return(true)
    end

    context "when called without options" do
      it "tails the last 50 lines of both log files" do
        described_class.call("daily-update")

        expect(described_class).to have_received(:system).with(
          "tail", "-n", "50", stdout_path, stderr_path, exception: false
        )
      end
    end

    context "when given a custom line count" do
      it "tails that many lines" do
        described_class.call("daily-update", lines: 10)

        expect(described_class).to have_received(:system).with(
          "tail", "-n", "10", stdout_path, stderr_path, exception: false
        )
      end
    end

    context "when no task with the given name exists" do
      it "raises an error" do
        expect { described_class.call("nonexistent") }.to raise_error(ArgumentError, "Unknown task: nonexistent")
      end
    end
  end
end
