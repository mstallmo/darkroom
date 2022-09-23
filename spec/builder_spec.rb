# frozen_string_literal: true

module Darkroom
  RSpec.describe Builder do
    context "when getting options" do
      it "returns passed in empty options" do
        builder = described_class.new({})
        expect(builder.options).to eq({})
      end

      it "returns passed in populated options" do
        options = { test: "value" }
        builder = described_class.new(options)
        expect(builder.options).to eq(options)
      end
    end
  end
end
