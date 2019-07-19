# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Measurements::Mass do
  let(:units) { 2 }
  let(:klass) { described_class.new(units) }

  describe '#convert' do
    context 'when converting between imperial' do
      it 'to be 2 from ounces to ounces' do
        expect(klass.convert(from: :ounces, to: :ounces)).to eq(units)
      end

      it 'to be 0.014 from stones to us_tons' do
        expect(klass.convert(from: :stones, to: :us_tons)).to eq(0.014)
      end
    end

    context 'when converting between metric' do
      it 'to be 2 from grams to grams' do
        expect(klass.convert(from: :grams, to: :grams)).to eq(units)
      end

      it 'to be 2_000 from metric_tons to kilograms' do
        expect(klass.convert(from: :metric_tons, to: :kilograms)).to eq(2_000)
      end

      it 'to be 0.002 from metric_tons to kilograms' do
        expect(klass.convert(from: :micrograms, to: :milligrams)).to eq(0.002)
      end
    end

    context 'when converting from imperial to metric' do
      it 'to be 56.69904625 from ounces to grams' do
        expect(klass.convert(from: :ounces, to: :grams)).to eq(56.69904625)
      end

      it 'to be 907184.74 from pounds to milligrams' do
        expect(klass.convert(from: :pounds, to: :milligrams)).to eq(907_184.74)
      end
    end

    context 'when converting from metric to imperial' do
      it 'to be 0.07054792389916083 from grams to ounces' do
        expect(klass.convert(from: :grams, to: :ounces)).to eq(0.07054792389916083)
      end

      it 'to be 0.3149460888355394 from kilograms to stones' do
        expect(klass.convert(from: :kilograms, to: :stones)).to eq(0.3149460888355394)
      end
    end
  end

  describe '#monkey_patch' do
    it 'to be 56.69904625' do
      expect(2.convert_mass(from: :ounces, to: :grams)).to eq(56.69904625)
    end
  end

end
