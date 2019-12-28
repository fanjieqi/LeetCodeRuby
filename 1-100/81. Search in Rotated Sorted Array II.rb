# @param {Integer[]} nums
# @param {Integer} target
# @return {Boolean}
def search(nums, target)
  !!nums.uniq.find{|ele| ele == target}
end
