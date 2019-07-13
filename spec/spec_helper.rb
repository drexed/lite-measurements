# frozen_string_literal: true

require 'bundler/setup'
require 'lite/measurements'
require 'generator_spec'

Lite::Measurements.configure do |config|
  config.monkey_patch = %w[
    temperature
  ]
end

spec_path = Pathname.new(File.expand_path('../spec', File.dirname(__FILE__)))

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.after(:all) do
    temp_path = spec_path.join('generators/lite/tmp')
    FileUtils.remove_dir(temp_path) if File.directory?(temp_path)
  end
end