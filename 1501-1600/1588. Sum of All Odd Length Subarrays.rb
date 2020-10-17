# @param {Integer[]} arr
# @return {Integer}
def sum_odd_length_subarrays(arr)
  sum, ans = [0], 0
  arr.each_with_index { |num, i| sum[i+1] = sum[i] + num }
  (1..arr.size).each do |i|
    next if i.even?
    (0..arr.size-i).each do |j|
      ans += sum[j+i] - sum[j]
    end
  end
  ans
end
