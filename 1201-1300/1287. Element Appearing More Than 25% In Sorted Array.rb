# @param {Integer[]} arr
# @return {Integer}
def find_special_integer(arr)
  count, threshold = {}, arr.size / 4
  arr.each do |num|
    count[num] = count[num].to_i + 1
    return num if count[num] > threshold
  end
end
