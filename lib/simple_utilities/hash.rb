# frozen_string_literal: true

require 'active_support/core_ext/hash/indifferent_access'
# Monkey patching hash
# Adding the below methods and indifferent_access too from active_support
# with_indifferent_access:
#        hash = {a: 'a', b: 'b', c: 'c'}.with_indifferent_access
#        hash[:a] == hash['a']
# deep_keys:
#         hash = {a: 1, b: {c: '123'}}
#         hash.deep_keys = %i[a b c]
class Hash
  def deep_transform_values(&block)
    transform_values do |v|
      v.is_a?(Hash) ? v.deep_transform_values(&block) : yield(v)
    end
  end

  def deep_transform_values!(&block)
    each do |k, v|
      self[k] = v.is_a?(Hash) ? v.deep_transform_values!(&block) : yield(v)
    end
    self
  end

  def deep_keys
    reduce([]) do |memo, (k, v)|
      memo << (v.is_a?(Hash) ? [k, v.deep_keys] : k)
    end.flatten
  end

  def reject_empty
    reject { |_, v| v.to_s.empty? }
  end

  def reject_empty!
    reject! { |_, v| v.to_s.empty? }
  end
end
