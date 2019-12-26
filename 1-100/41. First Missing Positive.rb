# @param {Integer[]} nums
# @return {Integer}
def first_missing_positive(nums)
  max = nums.max.to_i + 1
  hash = nums.select(&:positive?).map{|ele| [ele, true] }.to_h
  (1..max).find {|i| !hash[i] } || 1
end
