# @param {Integer[]} arr
# @return {Integer[]}
def array_rank_transform(arr)
  nums = arr.uniq.sort
  arr.map { |num| nums.bsearch_index { |ele| ele >= num } + 1 }
end
