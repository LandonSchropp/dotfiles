# frozen_string_literal: true

require_relative "../../local/share/schedule/launch_agent"

describe LaunchAgent do
  describe ".build" do
    subject(:plist) { described_class.build(task) }

    let(:task) { { "name" => "smoke-test", "cron" => "30 9 * * *", "command" => "echo hello" } }

    it "builds the label from the task name" do
      expect(plist["Label"]).to eq("com.landonschropp.schedule.smoke-test")
    end

    it "wraps the command in a zsh login shell" do
      expect(plist["ProgramArguments"]).to eq(["/bin/zsh", "-lc", "echo hello"])
    end

    it "derives the stdout path from the label" do
      expect(plist["StandardOutPath"]).to eq(
        File.expand_path("~/Library/Logs/com.landonschropp.schedule.smoke-test/stdout.log")
      )
    end

    it "derives the stderr path from the label" do
      expect(plist["StandardErrorPath"]).to eq(
        File.expand_path("~/Library/Logs/com.landonschropp.schedule.smoke-test/stderr.log")
      )
    end

    context "when the cron expression has no weekdays" do
      let(:task) { { "name" => "smoke-test", "cron" => "30 9 * * *", "command" => "echo hello" } }

      it "returns a single interval with the minute and hour" do
        expect(plist["StartCalendarInterval"]).to eq([{ "Minute" => 30, "Hour" => 9 }])
      end
    end

    context "when the cron expression has weekdays" do
      let(:task) { { "name" => "smoke-test", "cron" => "30 9 * * 1,3", "command" => "echo hello" } }

      it "returns one interval per weekday" do
        expect(plist["StartCalendarInterval"]).to contain_exactly(
          { "Minute" => 30, "Hour" => 9, "Weekday" => 1 },
          { "Minute" => 30, "Hour" => 9, "Weekday" => 3 }
        )
      end
    end

    context "when the minute and hour are wildcards" do
      let(:task) { { "name" => "smoke-test", "cron" => "* * * * 1", "command" => "echo hello" } }

      it "omits the Minute and Hour keys" do
        expect(plist["StartCalendarInterval"]).to eq([{ "Weekday" => 1 }])
      end
    end
  end

  describe ".label_for" do
    it "prefixes the task name" do
      expect(described_class.label_for("smoke-test")).to eq("com.landonschropp.schedule.smoke-test")
    end
  end
end
