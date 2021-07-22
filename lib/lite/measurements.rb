# frozen_string_literal: true

require 'generators/lite/measurements/install_generator' if defined?(Rails::Generators)

require 'lite/measurements/version'
require 'lite/measurements/helpers/conversion_helper'
require 'lite/measurements/helpers/shift_helper'
require 'lite/measurements/base'
require 'lite/measurements/digital_storage'
require 'lite/measurements/length'
require 'lite/measurements/mass'
require 'lite/measurements/temperature'
require 'lite/measurements/time'
