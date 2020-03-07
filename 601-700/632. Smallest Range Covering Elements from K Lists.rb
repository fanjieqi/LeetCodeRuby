# @param {Integer[][]} nums
# @return {Integer[]}
def smallest_range(nums)
  array = nums.flatten.uniq.sort
  left = array.first
  right = array.last
  array.each_with_index do |l, i|
    array[i..-1].each do |r|
      next if r - l >= right - left
      left, right = l, r if nums.all? { |list| (k = list.bsearch_index{|n1| n1 >= l }) && list[k] <= r }
    end
  end
  [left, right]
end
