# frozen_string_literal: true

module Lite
  module Measurements
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)

      def copy_initializer_file
        copy_file('install.rb', 'config/initializers/lite-measurements.rb')
      end

    end
  end
end
