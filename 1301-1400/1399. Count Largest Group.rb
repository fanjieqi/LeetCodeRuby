# @param {Integer} n
# @return {Integer}
def count_largest_group(n)
  hash = {}
  (1..n).each do |i|
    sum = i.to_s.split("").map(&:to_i).sum
    hash[sum] = hash[sum].to_i + 1
  end
  max = hash.values.max
  hash.select { |k, v| v == max }.size
end
