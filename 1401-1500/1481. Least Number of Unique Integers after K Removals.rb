# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def find_least_num_of_unique_ints(arr, k)
  count = {}
  arr.each do |num|
    count[num] = count[num].to_i + 1
  end
  nums = count.keys.sort_by { |num| count[num] }
  nums.each do |num|
    break if count[num] > k
    k -= count.delete(num)
  end
  count.size
end
