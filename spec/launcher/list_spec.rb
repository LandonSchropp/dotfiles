# frozen_string_literal: true

require_relative "../../local/share/launcher/list"

describe List do
  describe ".call" do
    let(:daily_task) do
      Task.new(name: "daily-update", description: "Updates everything daily", command: "daily-update", cron: "0 7 * * *")
    end
    let(:weekly_task) do
      Task.new(name: "weekly-update", description: "Updates less often", command: "weekly-update", cron: "0 13 * * 5")
    end

    before { allow(Task).to receive(:all).and_return(tasks) }

    context "when a single task's agent is loaded" do
      let(:tasks) { [daily_task] }

      before do
        allow(described_class).to receive(:system).with(
          "launchctl", "list", daily_task.label, out: File::NULL, err: File::NULL
        ).and_return(true)
      end

      it "prints the task's name, status, and description" do
        expect { described_class.call }.to output("daily-update  loaded  Updates everything daily\n").to_stdout
      end
    end

    context "when a single task's agent is not loaded" do
      let(:tasks) { [daily_task] }

      before do
        allow(described_class).to receive(:system).with(
          "launchctl", "list", daily_task.label, out: File::NULL, err: File::NULL
        ).and_return(false)
      end

      it "prints the task's name, status, and description" do
        expect { described_class.call }.to output("daily-update  not loaded  Updates everything daily\n").to_stdout
      end
    end

    context "when tasks have names and statuses of different lengths" do
      let(:tasks) { [daily_task, weekly_task] }

      before do
        allow(described_class).to receive(:system).with(
          "launchctl", "list", daily_task.label, out: File::NULL, err: File::NULL
        ).and_return(true)
        allow(described_class).to receive(:system).with(
          "launchctl", "list", weekly_task.label, out: File::NULL, err: File::NULL
        ).and_return(false)
      end

      it "pads the name and status columns to the widest value" do
        expect { described_class.call }.to output(
          <<~OUTPUT
            daily-update   loaded      Updates everything daily
            weekly-update  not loaded  Updates less often
          OUTPUT
        ).to_stdout
      end
    end
  end
end
