# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Measurements::Configuration do
  after do
    Lite::Measurements.configure do |config|
      config.monkey_patch = %w[
        temperature
      ]
    end
  end

  describe '#configure' do
    it 'to be "foo"' do
      Lite::Measurements.configuration.monkey_patch = 'foo'

      expect(Lite::Measurements.configuration.monkey_patch).to eq('foo')
    end
  end

end
