# frozen_string_literal: true

# Test
class Numeric
  def to_currency(precision = 2)
    format("%.#{precision}f", self)
  end
end
