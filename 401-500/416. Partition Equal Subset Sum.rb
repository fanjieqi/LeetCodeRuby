# @param {Integer[]} nums
# @return {Boolean}
def can_partition(nums)
  sum = nums.sum
  return false if sum % 2 == 1

  mid = sum / 2
  hash = {}
  nums.each do |num|
    hash.keys.each do |key|
      next if key + num > mid
      hash[key+num] = true
    end
    hash[num] = true
    return true if hash[mid]
  end
  false
end
