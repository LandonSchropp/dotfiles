require_relative "../../local/share/schedule/cron"

describe Cron do
  describe ".parse" do
    subject(:result) { described_class.parse(expression) }

    context "when minute, hour, and weekday are exact values" do
      let(:expression) { "30 9 * * 1" }

      it "returns the minute" do
        expect(result.minute).to eq(30)
      end

      it "returns the hour" do
        expect(result.hour).to eq(9)
      end

      it "returns the weekday as a symbol" do
        expect(result.weekdays).to eq([:monday])
      end
    end

    context "when the weekday field is a comma-separated list" do
      let(:expression) { "0 9 * * 1,3,5" }

      it "returns each weekday as a symbol" do
        expect(result.weekdays).to eq(%i[monday wednesday friday])
      end
    end

    context "when the minute field is a wildcard" do
      let(:expression) { "* 9 * * 1" }

      it "returns nil for the minute" do
        expect(result.minute).to be_nil
      end
    end

    context "when the hour field is a wildcard" do
      let(:expression) { "0 * * * 1" }

      it "returns nil for the hour" do
        expect(result.hour).to be_nil
      end
    end

    context "when the weekday field is a wildcard" do
      let(:expression) { "0 9 * * *" }

      it "returns nil for the weekdays" do
        expect(result.weekdays).to be_nil
      end
    end

    context "when the minute is out of range" do
      let(:expression) { "60 9 * * 1" }

      it "raises an error" do
        expect { result }.to raise_error(ArgumentError, /Invalid cron expression/)
      end
    end

    context "when the hour is out of range" do
      let(:expression) { "0 24 * * 1" }

      it "raises an error" do
        expect { result }.to raise_error(ArgumentError, /Invalid cron expression/)
      end
    end

    context "when a weekday is out of range" do
      let(:expression) { "0 9 * * 7" }

      it "raises an error" do
        expect { result }.to raise_error(ArgumentError, /Invalid cron expression/)
      end
    end

    context "when the day-of-month or month fields are not wildcards" do
      let(:expression) { "0 9 15 * 1" }

      it "raises an error" do
        expect { result }.to raise_error(ArgumentError, /Invalid cron expression/)
      end
    end

    context "when the expression does not have exactly 5 fields" do
      let(:expression) { "0 9 * *" }

      it "raises an error" do
        expect { result }.to raise_error(ArgumentError, /Invalid cron expression/)
      end
    end
  end
end
