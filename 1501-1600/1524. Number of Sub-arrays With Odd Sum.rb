MOD = 10**9 + 7
# @param {Integer[]} arr
# @return {Integer}
def num_of_subarrays(arr)
  sum, odd = [], []
  arr.each_with_index { |num, i| sum[i] = sum[i-1].to_i + num }
  (0..sum.size-1).each do |i|
    if arr[i].odd?
      odd[i] = (i > 0 ? i-odd[i-1].to_i : 0) + 1
    else
      odd[i] = i > 0 ? odd[i-1].to_i : 0
    end
  end
  odd.sum % MOD
end
