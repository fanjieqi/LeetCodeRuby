# @param {String} s
# @return {Integer}
def longest_palindrome(s)
  hash = s.split("").group_by(&:itself).transform_values(&:count)
  hash.values.inject(0){|sum, count| sum += count.even? ? count : count - 1} + (hash.values.any?(&:odd?) ? 1 : 0)
end
