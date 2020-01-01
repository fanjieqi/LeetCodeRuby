# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
  hash = {}
  nums.each_with_index do |num, i|
    hash[num] ||= []
    hash[num] << i
  end

  ready = nums.group_by(&:itself).select {|k, v| v.count > 1}.map(&:first)
  ready.any? do |num|
    hash[num].any? do |i|
      hash[num].any? do |j|
        i != j && (i - j).abs <= k
      end
    end
  end
end
