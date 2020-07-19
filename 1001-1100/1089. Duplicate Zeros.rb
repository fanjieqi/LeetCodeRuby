# @param {Integer[]} arr
# @return {Void} Do not return anything, modify arr in-place instead.
def duplicate_zeros(arr)
  arr.join.gsub("0", "00").split("")[0, arr.size].map(&:to_i).each_with_index do |num, i|
    arr[i] = num
  end
end
