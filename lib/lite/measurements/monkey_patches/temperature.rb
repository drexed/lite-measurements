# frozen_string_literal: true

class Numeric

  def convert_temperature(from:, to:)
    Lite::Measurements::Temperature.convert(self, from: from, to: to)
  end

end
