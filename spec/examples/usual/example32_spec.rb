# frozen_string_literal: true

RSpec.describe Usual::Example32 do
  describe ".call!" do
    subject(:perform) { described_class.call! }

    context "when the input arguments are valid" do
      describe "and the data required for work is also valid" do
        include_examples "success result class"

        it "returns the expected value in `first_id`" do
          result = perform

          expect(result.number).to eq(7)
        end
      end
    end
  end

  describe ".call" do
    subject(:perform) { described_class.call }

    context "when the input arguments are valid" do
      describe "and the data required for work is also valid" do
        include_examples "success result class"

        it "returns the expected value in `first_id`" do
          result = perform

          expect(result.number).to eq(7)
        end
      end
    end
  end
end
