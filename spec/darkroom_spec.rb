# frozen_string_literal: true

RSpec.describe Darkroom do
  it "has a version number" do
    expect(Darkroom::VERSION).not_to be_nil
  end

  context "when setting source" do
    it "returns options with a source" do
      pipeline = described_class.source("test-file.jpg")

      expect(pipeline.options).to eq({ source: "test-file.jpg" })
    end

    it "returns a new source if already set" do
      pipeline =
        described_class.source("test-file.jpg").source("other-file.jpeg")

      expect(pipeline.options).to eq({ source: "other-file.jpeg" })
    end
  end
end
