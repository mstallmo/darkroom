# frozen_string_literal: true

require "tempfile"

RSpec.describe Darkroom do
  it "has a version number" do
    expect(Darkroom::VERSION).not_to be_nil
  end

  context "when setting source" do
    it "returns options with a source" do
      pipeline = described_class.source("test-file.jpg")

      expect(pipeline.options[:source]).to eq "test-file.jpg"
    end

    it "returns a new source if already set" do
      pipeline =
        described_class.source("test-file.jpg").source("other-file.jpeg")

      expect(pipeline.options[:source]).to eq "other-file.jpeg"
    end
  end

  context "when adding an operation" do
    it "returns options with the operation" do
      pipeline =
        described_class.source("test-file.jpg").operation(
          :resize_to_limit,
          400,
          400,
        )

      expect(pipeline.options[:operations]).to eq [
           [:resize_to_limit, [400, 400]],
         ]
    end

    it "raises an exception when adding an unsupported operation" do
      pipeline = described_class.source("test-file.jpg")

      expect {
        pipeline.operation(:unsupported_operation, 100, 100)
      }.to raise_error Darkroom::UnsupportedOperation
    end
  end

  context "when executing the built pipeline" do
    it "returns a tempfile when called with zero arguments" do
      output = described_class.source("test-file.jpg").call

      expect(output).to be_instance_of Tempfile
    end
  end
end
