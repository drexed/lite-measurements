# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Measurements::Temperature do
  let(:units) { 2 }
  let(:klass) { described_class.new(units) }

  describe '#convert' do
    context 'when converting from celcius' do
      it 'to be 2 for celcius' do
        expect(klass.convert(from: :celsius, to: :celsius)).to eq(units)
      end

      it 'to be 35.6 for fahrenheit' do
        expect(klass.convert(from: :celsius, to: :fahrenheit)).to eq(35.6)
      end

      it 'to be 275.15 for kelvin' do
        expect(klass.convert(from: :celsius, to: :kelvin)).to eq(275.15)
      end
    end

    context 'when converting from fahrenheit' do
      it 'to be 2 for fahrenheit' do
        expect(klass.convert(from: :fahrenheit, to: :fahrenheit)).to eq(units)
      end

      it 'to be -16.666666666666668 for celcius' do
        expect(klass.convert(from: :fahrenheit, to: :celsius)).to eq(-16.666666666666668)
      end

      it 'to be 256.4833333333333 for kelvin' do
        expect(klass.convert(from: :fahrenheit, to: :kelvin)).to eq(256.4833333333333)
      end
    end

    context 'when converting from kelvin' do
      it 'to be 2 for kelvin' do
        expect(klass.convert(from: :kelvin, to: :kelvin)).to eq(units)
      end

      it 'to be -271.15 for celcius' do
        expect(klass.convert(from: :kelvin, to: :celsius)).to eq(-271.15)
      end

      it 'to be -456.07 for fahrenheit' do
        expect(klass.convert(from: :kelvin, to: :fahrenheit)).to eq(-456.07)
      end
    end
  end

  describe '#monkey_patch' do
    it 'to be 256.4833333333333' do
      expect(2.convert_temperature(from: :fahrenheit, to: :kelvin)).to eq(256.4833333333333)
    end
  end

end
