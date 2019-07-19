# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Measurements::Time do
  let(:units) { 2 }
  let(:klass) { described_class.new(units) }

  describe '#convert' do
    context 'when converting from seconds' do
      it 'to be 2 for seconds' do
        expect(klass.convert(from: :seconds, to: :seconds)).to eq(units)
      end

      it 'to be 2000 for milliseconds' do
        expect(klass.convert(from: :seconds, to: :milliseconds)).to eq(2_000)
      end

      it 'to be 0.03333333333333333 for minutes' do
        expect(klass.convert(from: :seconds, to: :minutes)).to eq(0.03333333333333333)
      end
    end

    context 'when converting from millenniums' do
      it 'to be 2000 for years' do
        expect(klass.convert(from: :millenniums, to: :years)).to eq(2_000)
      end
    end
  end

  describe '#monkey_patch' do
    it 'to be 2000' do
      expect(2.convert_time(from: :seconds, to: :milliseconds)).to eq(2_000)
    end
  end

end
