# @param {Integer[]} nums
# @return {String}
def largest_number(nums)
  nums.map(&:to_s).sort {|x, y| y+x <=> x+y }.join("").to_i.to_s
end
