# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Measurements::Configuration do
  after { Lite::Measurements.reset_configuration! }

  describe '#configure' do
    it 'to be "foo"' do
      Lite::Measurements.configuration.monkey_patches = 'foo'

      expect(Lite::Measurements.configuration.monkey_patches).to eq('foo')
    end
  end

  describe '#reset_configuration!' do
    it 'to be true' do
      Lite::Measurements.configuration.monkey_patches = 'foo'
      Lite::Measurements.reset_configuration!

      expect(Lite::Measurements.configuration.monkey_patches).to eq(true)
    end
  end

end
