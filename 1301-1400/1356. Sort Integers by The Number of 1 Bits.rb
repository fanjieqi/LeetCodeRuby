# @param {Integer[]} arr
# @return {Integer[]}
def sort_by_bits(arr)
  arr.sort_by { |num| [num.to_s(2).scan('1').size, num] }
end
