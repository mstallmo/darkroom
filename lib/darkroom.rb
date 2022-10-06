# frozen_string_literal: true

require_relative "darkroom/version"
require_relative "darkroom/chainable"
require_relative "darkroom/builder"
require_relative "darkroom/pipeline"

module Darkroom
  extend Chainable

  class Error < StandardError
  end

  class UnsupportedOperation < StandardError
  end
end
