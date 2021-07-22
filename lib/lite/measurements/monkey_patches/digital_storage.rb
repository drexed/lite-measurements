# frozen_string_literal: true

class Numeric

  def convert_digital_storage(from:, to:)
    Lite::Measurements::DigitalStorage.convert(self, from: from, to: to)
  end

end
