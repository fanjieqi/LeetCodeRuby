# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def constrained_subset_sum(nums, k)
  hash, arr, ans = {}, [], nil
  nums.each_with_index do |num, i|
    if i == 0
      max = num
    else
      max = num > 0 ? num : nil
      hash.each do |j, sum|
        tmp = sum + num
        max = tmp if max.nil? || sum + num > max
      end

      while !arr.empty? && arr[0][1] < max
        j, _ = arr.shift
        hash.delete(j)
      end

      hash.delete(i-k)
    end
    arr.unshift([i, max])
    hash[i] = max
    ans = max if ans.nil? || max > ans
  end
  ans
end
