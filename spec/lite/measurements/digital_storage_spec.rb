# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Measurements::DigitalStorage do
  let(:units) { 2 }
  let(:klass) { described_class.new(units) }

  describe '#convert' do
    context 'when converting from bytes' do
      it 'to be 2 for bytes' do
        expect(klass.convert(from: :bytes, to: :bytes)).to eq(units)
      end

      it 'to be 0.001953125 for kilobytes' do
        expect(klass.convert(from: :bytes, to: :kilobytes)).to eq(0.001953125)
      end
    end

    context 'when converting from gigabytes' do
      it 'to be 2048.0 for megabytes' do
        expect(klass.convert(from: :gigabytes, to: :megabytes)).to eq(2048.0)
      end
    end
  end

  describe '#monkey_patch' do
    it 'to be 0.001953125' do
      expect(2.convert_digital_storage(from: :bytes, to: :kilobytes)).to eq(0.001953125)
    end
  end

end
