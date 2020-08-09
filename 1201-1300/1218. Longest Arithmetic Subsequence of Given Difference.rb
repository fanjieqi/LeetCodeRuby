# @param {Integer[]} arr
# @param {Integer} difference
# @return {Integer}
def longest_subsequence(arr, difference)
  f = {}
  arr.each do |num|
    tmp = f[num-difference].to_i + 1
    f[num] = tmp if tmp > f[num].to_i
  end
  f.values.max
end
