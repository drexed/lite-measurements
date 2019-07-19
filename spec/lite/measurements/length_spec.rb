# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Measurements::Length do
  let(:units) { 2 }
  let(:klass) { described_class.new(units) }

  describe '#convert' do
    context 'when converting between imperial' do
      it 'to be 2 from inches to inches' do
        expect(klass.convert(from: :inches, to: :inches)).to eq(units)
      end

      it 'to be 0.0011363636363636363 from yards to miles' do
        expect(klass.convert(from: :yards, to: :miles)).to eq(0.0011363636363636363)
      end
    end

    context 'when converting between metric' do
      it 'to be 2 from meters to meters' do
        expect(klass.convert(from: :meters, to: :meters)).to eq(units)
      end

      it 'to be 0.002 from centimeters to dekameters' do
        expect(klass.convert(from: :centimeters, to: :dekameters)).to eq(0.002)
      end

      it 'to be 0.002 from micrometers to kilometers' do
        expect(klass.convert(from: :micrometers, to: :millimeters)).to eq(0.002)
      end
    end

    context 'when converting from imperial to metric' do
      it 'to be 0.0508 from inches to meters' do
        expect(klass.convert(from: :inches, to: :meters)).to eq(0.0508)
      end

      it 'to be 609.5999999999999 from feet to millimeters' do
        expect(klass.convert(from: :feet, to: :millimeters)).to eq(609.5999999999999)
      end
    end

    context 'when converting from metric to imperial' do
      it 'to be 78.74015748031496 from meters to inches' do
        expect(klass.convert(from: :meters, to: :inches)).to eq(78.74015748031496)
      end

      it 'to be 2187.2265966754157 from kilometers to yards' do
        expect(klass.convert(from: :kilometers, to: :yards)).to eq(2187.2265966754157)
      end
    end
  end

  describe '#monkey_patch' do
    it 'to be 0.0508' do
      expect(2.convert_length(from: :inches, to: :meters)).to eq(0.0508)
    end
  end

end
