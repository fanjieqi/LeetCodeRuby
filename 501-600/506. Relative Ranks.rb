RANKS = {
  0 => "Gold Medal",
  1 => "Silver Medal",
  2 => "Bronze Medal",
}

# @param {Integer[]} nums
# @return {String[]}
def find_relative_ranks(nums)
  nums = nums.map.with_index{|num,i| [num,i]}.sort_by(&:first).reverse
  nums.map.with_index {|(k, v), i| i<=2 ? [RANKS[i], v] : [(i+1).to_s, v] }.sort_by(&:last).map(&:first)
end
