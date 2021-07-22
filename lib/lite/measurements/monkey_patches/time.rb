# frozen_string_literal: true

class Numeric

  def convert_time(from:, to:)
    Lite::Measurements::Time.convert(self, from: from, to: to)
  end

end
