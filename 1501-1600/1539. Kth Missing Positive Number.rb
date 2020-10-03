# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def find_kth_positive(arr, k)
  hash = {}
  (1..2000).each { |num| hash[num] = true }
  arr.each { |num| hash.delete(num) }
  hash.keys.sort[k-1]
end
