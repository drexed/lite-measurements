# frozen_string_literal: true

RSpec.describe Lite::Measurements do
  it 'to be a version number' do
    expect(Lite::Measurements::VERSION).not_to be nil
  end
end
