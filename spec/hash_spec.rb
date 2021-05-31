# frozen_string_literal: true

require 'simple_utilities/hash'
describe Hash do
  describe '#indifferent_access' do
    it 'value can be accessed through string or symbol' do
      hash = { a: 1, b: 2 }.with_indifferent_access
      expect(hash[:a]).to eq(hash['a'])
    end
  end

  describe '#deep_transform_values' do
    it 'does not update the calling object' do
      hash = { a: 1, b: { c: 3 } }
      transformed_hash = hash.deep_transform_values { |v| v * 2 }

      expect(hash[:a]).not_to eq(2)
      expect(transformed_hash[:a]).to eq(2)
      expect(hash.dig(:b, :c)).not_to eq(6)
      expect(transformed_hash.dig(:b, :c)).to eq(6)
    end

    it 'bang version - updates the calling object' do
      hash = { a: 1, b: { c: 3 } }
      hash.deep_transform_values! { |v| v * 2 }

      expect(hash[:a]).to eq(2)
      expect(hash.dig(:b, :c)).to eq(6)
    end
  end

  describe '#reject_keys' do
    it 'value is empty or nil' do
      hash = { a: 1, b: nil, c: '' }
      rejected_hash = hash.reject_empty
      expect(hash.keys).to include(:b)
      expect(rejected_hash.keys).not_to include(:b)
      expect(hash.keys).to include(:b)
      expect(rejected_hash.keys).not_to include(:c)
    end

    it 'bang version - updates the calling object' do
      hash = { a: 1, b: nil, c: '' }
      hash.reject_empty!
      expect(hash.keys).not_to include(:b)
      expect(hash.keys).not_to include(:c)
    end
  end

  describe '#deep_keys' do
    it 'gets an array of keys' do
      hash = { a: 1, b: { c: 3 } }
      expect(hash.deep_keys).to eq(%i[a b c])
    end
  end
end
