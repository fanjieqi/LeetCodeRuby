# @param {Integer[]} arr
# @return {Integer}
def min_set_size(arr)
  hash = {}
  arr.each { |num| hash[num] = hash[num].to_i + 1 }
  count = 0
  hash.values.sort.reverse.each_with_index do |size, i|
    count += size
    return i+1 if count >= arr.size / 2
  end
end
