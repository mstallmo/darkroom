# frozen_string_literal: true

module Darkroom
  module Chainable
    def source(file_path)
      set_option source: file_path
    end

    def set_option(**new_options)
      options = (is_a?(Builder) ? self.options.merge(new_options) : new_options)

      Builder.new(options)
    end
  end
end
