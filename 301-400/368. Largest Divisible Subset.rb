# @param {Integer[]} nums
# @return {Integer[]}
def largest_divisible_subset(nums)
  return [] if nums.length == 0
  hash = {}
  nums.sort.each do |x|
    hash[x] = [x]
    hash.each do |d, v|
      if x % d == 0
        tmp = hash[d] | [x]
        hash[x] = tmp if tmp.length > hash[x].length
      end
    end
  end
  max_l = hash.values.map(&:length).max
  hash.find{|k, v| v.length == max_l}.last.sort
end
