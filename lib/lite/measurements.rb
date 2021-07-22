# frozen_string_literal: true

require 'generators/lite/measurements/install_generator' if defined?(Rails::Generators)

require 'lite/measurements/version'
require 'lite/measurements/configuration'

%w[conversion shift].each do |filename|
  require "lite/measurements/helpers/#{filename}_helper"
end

%w[base digital_storage length mass temperature time monkey_patches].each do |filename|
  require "lite/measurements/#{filename}"
end
