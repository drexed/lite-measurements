# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Measurements::Mass do
  let(:mass) { 2 }
  let(:klass) { described_class.new(mass) }

  describe '#convert' do
    context 'when converting between imperial' do
      it 'to be 2 from ounces to ounces' do
        expect(klass.convert(from: :ounces, to: :ounces)).to eq(mass)
      end

      it 'to be 0.014 from stones to us_tons' do
        expect(klass.convert(from: :stones, to: :us_tons)).to eq(0.014)
      end
    end

    context 'when converting between metric' do
      it 'to be 2 from grams to grams' do
        expect(klass.convert(from: :grams, to: :grams)).to eq(mass)
      end

      it 'to be 2_000 from metric_tons to kilograms' do
        expect(klass.convert(from: :metric_tons, to: :kilograms)).to eq(2_000)
      end

      it 'to be 0.002 from metric_tons to kilograms' do
        expect(klass.convert(from: :micrograms, to: :milligrams)).to eq(0.002)
      end
    end

    context 'when converting from imperial to metric' do
      it 'to be 56.699_046 from ounces to grams' do
        expect(klass.convert(from: :ounces, to: :grams)).to eq(56.699_046)
      end

      it 'to be 907_184.736 from pounds to milligrams' do
        expect(klass.convert(from: :pounds, to: :milligrams)).to eq(907_184.736)
      end
    end

    context 'when converting from metric to imperial' do
      it 'to be 0.070_547_924_210_223_92 from grams to ounces' do
        expect(klass.convert(from: :grams, to: :ounces)).to eq(0.070_547_924_210_223_92)
      end

      it 'to be 0.314_946_090_224_213_94 from kilograms to stones' do
        expect(klass.convert(from: :kilograms, to: :stones)).to eq(0.314_946_090_224_213_94)
      end
    end
  end

  describe '#monkey_patch' do
    it 'to be 56.699_046' do
      expect(2.convert_mass(from: :ounces, to: :grams)).to eq(56.699_046)
    end
  end

end
