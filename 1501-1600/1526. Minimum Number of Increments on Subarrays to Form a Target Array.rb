# @param {Integer[]} target
# @return {Integer}
def min_number_operations(target)
  count, tmp = 0, 0
  target.each do |num|
    count += [num - tmp, 0].max
    tmp = num
  end
  count
end
