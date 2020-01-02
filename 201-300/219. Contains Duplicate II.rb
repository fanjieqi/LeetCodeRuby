# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
  hash = {}
  nums.each_with_index do |num, i|
    hash[num] ||= []
    hash[num] << i
  end

  hash.transform_values(&:sort)
  hash.each do |num, v|
    next if v.count <= 1
    (1..v.length-1).each do |i|
      return true if (v[i-1] - v[i]).abs <= k
    end
  end
  false
end
