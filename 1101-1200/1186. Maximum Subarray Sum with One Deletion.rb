# @param {Integer[]} arr
# @return {Integer}
def maximum_sum(arr)
  return arr.max if arr.all?(&:negative?)

  sum, deleted_once = [], []
  arr.each_with_index do |num, i|
    if i == 0
      sum[i] = num
      deleted_once[i] = [num, 0].max
    else
      sum[i] = [sum[i-1] + num, num].max
      deleted_once[i] = [sum[i-1] + num, num, deleted_once[i-1] + num, sum[i-1]].max
    end
  end
  deleted_once.max
end
