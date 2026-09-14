# frozen_string_literal: true

require_relative "../../local/share/launcher/launch_agent"

describe LaunchAgent do
  describe ".build" do
    subject(:plist) { described_class.build(task) }

    let(:task_class) { Data.define(:name, :command, :cron) }
    let(:task) { task_class.new(name: "smoke-test", command: "echo hello", cron: "30 9 * * *") }

    it "builds the label from the task name" do
      expect(plist["Label"]).to eq("com.landonschropp.smoke-test")
    end

    it "wraps the command in a zsh login shell" do
      expect(plist["ProgramArguments"]).to eq(["/bin/zsh", "-lc", "echo hello"])
    end

    it "derives the stdout path from the label" do
      expect(plist["StandardOutPath"]).to eq(
        File.expand_path("~/Library/Logs/com.landonschropp.smoke-test/stdout.log")
      )
    end

    it "derives the stderr path from the label" do
      expect(plist["StandardErrorPath"]).to eq(
        File.expand_path("~/Library/Logs/com.landonschropp.smoke-test/stderr.log")
      )
    end

    it "returns a single interval with the minute and hour" do
      expect(plist["StartCalendarInterval"]).to eq([{ "Minute" => 30, "Hour" => 9 }])
    end

    context "when the cron expression has a comma-separated weekday list" do
      let(:task) { task_class.new(name: "smoke-test", command: "echo hello", cron: "30 9 * * 1,3") }

      it "returns one interval per weekday" do
        expect(plist["StartCalendarInterval"]).to contain_exactly(
          { "Minute" => 30, "Hour" => 9, "Weekday" => 1 },
          { "Minute" => 30, "Hour" => 9, "Weekday" => 3 }
        )
      end
    end

    context "when the cron expression restricts the day of month and month" do
      let(:task) { task_class.new(name: "smoke-test", command: "echo hello", cron: "0 9 1 1 *") }

      it "maps them to the Day and Month keys" do
        expect(plist["StartCalendarInterval"]).to eq(
          [{ "Minute" => 0, "Hour" => 9, "Day" => 1, "Month" => 1 }]
        )
      end
    end
  end

  describe ".label" do
    it "prefixes the task name" do
      expect(described_class.label("smoke-test")).to eq("com.landonschropp.smoke-test")
    end
  end
end
