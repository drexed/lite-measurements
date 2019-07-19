# frozen_string_literal: true

class Numeric

  {
    digital_storage: Lite::Measurements::DigitalStorage,
    length: Lite::Measurements::Length,
    mass: Lite::Measurements::Mass,
    temperature: Lite::Measurements::Temperature,
    time: Lite::Measurements::Time
  }.each do |name, klass|
    define_method("convert_#{name}") do |from:, to:|
      klass.convert(self, from: from, to: to)
    end
  end

end
