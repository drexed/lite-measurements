# frozen_string_literal: true

module Lite
  module Measurements

    class Configuration

      attr_accessor :monkey_patch

      def initialize
        @monkey_patch = %w[
          temperature
        ]
      end

    end

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.configuration=(config)
      @configuration = config
    end

    def self.configure
      yield(configuration)
    end

  end
end
