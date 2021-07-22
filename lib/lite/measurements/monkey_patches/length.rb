# frozen_string_literal: true

class Numeric

  def convert_length(from:, to:)
    Lite::Measurements::Length.convert(self, from: from, to: to)
  end

end
