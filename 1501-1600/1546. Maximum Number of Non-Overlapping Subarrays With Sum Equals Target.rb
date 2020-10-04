# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def max_non_overlapping(nums, target)
  sum, indexes, f = [0], { 0=>[0] }, [0]
  nums.each_with_index do |num, i|
    sum[i+1] = sum[i] + num
    indexes[sum[i+1]] ||= []
    indexes[sum[i+1]] << i + 1
    basic = sum[i+1] - target
    f[i+1] = f[i]
    if num == target && target == 0
      f[i+1] += 1
    else
      indexes[basic]&.each do |j|
        next if i+1 == j
        f[i+1] = f[j]+1 if f[i+1].nil? || f[j]+1 > f[i+1]
      end
    end
  end
  f.max
end
