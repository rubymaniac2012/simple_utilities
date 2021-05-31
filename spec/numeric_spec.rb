# frozen_string_literal: true

require 'simple_utilities/numeric'
describe Numeric do
  describe '#to_currency' do
    it 'value is in currency format' do
      int_number = 2
      float_decimal = 5.1
      expect(int_number.to_currency).to eq('2.00')
      expect(float_decimal.to_currency).to eq('5.10')
    end
  end
end
