# frozen_string_literal: true

require_relative "../../local/share/launcher/cron"

describe Cron do
  describe ".expand" do
    subject(:combinations) { described_class.expand(expression) }

    context "when every field is an exact value" do
      let(:expression) { "30 9 * * 1" }

      it "returns a single combination" do
        expect(combinations).to eq([{ minute: 30, hour: 9, weekday: 1 }])
      end
    end

    context "when every field is a wildcard" do
      let(:expression) { "* * * * *" }

      it "raises an error" do
        expect { combinations }.to raise_error(ArgumentError, /matches every minute/)
      end
    end

    context "when a field is a comma list" do
      let(:expression) { "0 9 * * 1,3,5" }

      it "returns one combination per listed value" do
        expect(combinations).to contain_exactly(
          { minute: 0, hour: 9, weekday: 1 },
          { minute: 0, hour: 9, weekday: 3 },
          { minute: 0, hour: 9, weekday: 5 }
        )
      end
    end

    context "when a field is a range" do
      let(:expression) { "0 9-11 * * *" }

      it "returns one combination per value in the range" do
        expect(combinations).to contain_exactly(
          { minute: 0, hour: 9 },
          { minute: 0, hour: 10 },
          { minute: 0, hour: 11 }
        )
      end
    end

    context "when a field is a step" do
      let(:expression) { "*/15 9 * * *" }

      it "returns one combination per matching step" do
        expect(combinations).to contain_exactly(
          { minute: 0, hour: 9 },
          { minute: 15, hour: 9 },
          { minute: 30, hour: 9 },
          { minute: 45, hour: 9 }
        )
      end
    end

    context "when a field uses a named value" do
      let(:expression) { "0 9 * jan *" }

      it "resolves the name to its numeric value" do
        expect(combinations).to eq([{ minute: 0, hour: 9, month: 1 }])
      end
    end

    context "when multiple fields each have more than one matching value" do
      let(:expression) { "0 9-10 * * 1,2" }

      it "returns the cross product of every field's values" do
        expect(combinations).to contain_exactly(
          { minute: 0, hour: 9, weekday: 1 },
          { minute: 0, hour: 9, weekday: 2 },
          { minute: 0, hour: 10, weekday: 1 },
          { minute: 0, hour: 10, weekday: 2 }
        )
      end
    end

    context "when the expression is invalid" do
      let(:expression) { "bogus expression" }

      it "raises an error" do
        expect { combinations }.to raise_error(ArgumentError, /Invalid cron expression/)
      end
    end
  end
end
