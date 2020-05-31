# @param {Integer[]} a
# @return {Integer}
def max_subarray_sum_circular(a)
  total, max_sum, cur_max, min_sum, cur_min = 0, a[0], 0, a[0], 0
  a.each do |num|
    cur_max = [cur_max + num, num].max
    max_sum = [max_sum, cur_max].max
    cur_min = [cur_min + num, num].min
    min_sum = [min_sum, cur_min].min
    total += num
  end
  max_sum > 0 ? [max_sum, total - min_sum].max : max_sum
end
