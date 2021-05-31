# frozen_string_literal: true

require 'simple_utilities/array'
describe Array do
  describe 'reject_empty' do
    it 'value is empty or nil' do
      arr = ['a', 1, '', nil]
      rejected_arr = arr.reject_empty
      expect(arr).to include(nil)
      expect(rejected_arr).not_to include(nil)
      expect(arr).to include('')
      expect(rejected_arr).not_to include('')
    end

    it 'bang version - updates the calling object' do
      arr = ['a', 1, '', nil]
      arr.reject_empty!
      expect(arr).not_to include(nil)
      expect(arr).not_to include('')
    end
  end
end
