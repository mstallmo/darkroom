# frozen_string_literal: true

module Darkroom
  module Chainable
    def source(file_path)
      set_option source: file_path
    end

    def operation(name, *args)
      if SUPPORTED_OPERATIONS.include? name
        set_option operations: [[name, args]]
      else
        raise UnsupportedOperation.new "The operation #{name} is not currently supported by Darkroom"
      end
    end

    def call
      set_option.call!
    end

    def set_option(**new_options)
      options = (is_a?(Builder) ? self.options : DEFAULT_OPTIONS)

      options =
        options.merge(new_options) do |key, old_value, new_value|
          case key
          when :operations
            old_value + new_value
          else
            new_value
          end
        end

      Builder.new(options.freeze)
    end

    private

    DEFAULT_OPTIONS = { operations: [] }.freeze
    SUPPORTED_OPERATIONS = [:resize_to_limit].freeze
  end
end
