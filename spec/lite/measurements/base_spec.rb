# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Measurements::Base do
  let(:temperature) { 2 }
  let(:klass) { described_class.new(temperature) }
  let(:keys) { %i[foo bar] }

  describe '#convert' do
    it 'to be 275.15 when converted using class method' do
      results = Lite::Measurements::Temperature.convert(temperature, from: :celsius, to: :kelvin)

      expect(results).to eq(275.15)
    end
  end

  describe '#assert_valid_keys!' do
    it 'to raise error when empty' do
      expect { klass.send(:assert_valid_keys!, :baz) }.to raise_error(ArgumentError)
    end

    it 'to raise error when invalid key' do
      expect { klass.send(:assert_valid_keys!, :baz, *keys) }.to raise_error(ArgumentError)
    end
  end

end
