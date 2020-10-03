# @param {Integer[][]} grid
# @return {Integer}
def min_swaps(grid)
  n, count = grid.size, 0
  nums = grid.map { |num| num.join.to_i(2) }
  (0..n-1).each do |i|
    cur = 1 << (n-i-1)
    tmp = (1 << n-i) - 1
    j = nums.index { |num| num & tmp == cur || num & tmp == 0 }
    return -1 if j.nil?
    count += j
    nums.delete_at(j)
  end
  count
end
