# frozen_string_literal: true

require "tempfile"

module Darkroom
  class Pipeline
    attr_reader :pipeline_options

    def initialize(options)
      @pipeline_options = options
    end

    def call
      create_tempfile
    end

    private

    def create_tempfile
      Tempfile.new(%w[darkroom .jpeg], bindmode: true)
    end
  end
end
