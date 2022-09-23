# frozen_string_literal: true

module Darkroom
  class Builder
    include Chainable

    attr_reader :options

    def initialize(options)
      @options = options
    end
  end
end
