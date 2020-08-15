# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def is_possible_divide(nums, k)
  n = nums.size
  return false if n % k != 0
  hash = {}
  nums.each { |num| hash[num] = hash[num].to_i + 1 }
  keys = hash.keys.sort
  keys.each do |num|
    count = hash.delete(num)
    next if count.nil? || count.zero?
    (1..k-1).each do |i|
      tmp = num + i
      return false if hash[tmp].nil? || hash[tmp].zero?
      hash[tmp] -= count
      hash.delete(tmp) if hash[tmp].zero?
    end
  end
  true
end
