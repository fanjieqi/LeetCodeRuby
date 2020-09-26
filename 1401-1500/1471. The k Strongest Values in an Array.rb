# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer[]}
def get_strongest(arr, k)
  arr.sort!
  median = arr.size.odd? ? arr[arr.size/2] : arr[arr.size/2-1]
  arr.sort_by { |num| [-(num-median).abs, -num] }[0, k]
end
