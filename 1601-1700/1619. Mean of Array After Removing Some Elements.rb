# @param {Integer[]} arr
# @return {Float}
def trim_mean(arr)
  arr.sort!
  k = arr.size * 0.05
  arr[k..-k-1].sum  / (arr.size * 0.9)
end
