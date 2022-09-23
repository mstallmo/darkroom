# frozen_string_literal: true

require_relative "darkroom/version"
require_relative "darkroom/chainable"
require_relative "darkroom/builder"

module Darkroom
  extend Chainable

  class Error < StandardError
  end
end
