# frozen_string_literal: true

class Numeric

  {
    length: Lite::Measurements::Length,
    mass: Lite::Measurements::Mass,
    temperature: Lite::Measurements::Temperature
  }.each do |name, klass|
    define_method("convert_#{name}") do |from:, to:|
      klass.convert(self, from: from, to: to)
    end
  end

end
