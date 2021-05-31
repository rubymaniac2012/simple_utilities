# frozen_string_literal: true

# Test
class Array
  def reject_empty
    reject { |v| v.to_s.empty? }
  end

  def reject_empty!
    reject! { |v| v.to_s.empty? }
  end
end
