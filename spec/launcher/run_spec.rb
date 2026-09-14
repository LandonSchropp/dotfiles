# frozen_string_literal: true

require_relative "../../local/share/launcher/run"

describe Run do
  describe ".call" do
    subject(:call) { described_class.call(name) }

    let(:task) do
      Task.new(name: "daily-update", description: "Updates everything daily", command: "daily-update", cron: "0 7 * * *")
    end

    before do
      allow(Task).to receive(:all).and_return([task])
      allow(described_class).to receive(:system).and_return(true)
    end

    context "when a task with the given name exists" do
      let(:name) { "daily-update" }

      it "kicks off the task's agent" do
        call

        expect(described_class).to have_received(:system).with(
          "launchctl", "kickstart", "-k", "#{LaunchAgent.domain}/#{task.label}", exception: true
        )
      end
    end

    context "when no task with the given name exists" do
      let(:name) { "nonexistent" }

      it "raises an error" do
        expect { call }.to raise_error(ArgumentError, "Unknown task: nonexistent")
      end
    end
  end
end
