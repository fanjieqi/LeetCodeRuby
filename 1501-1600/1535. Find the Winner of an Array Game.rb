# @param {Integer[]} arr
# @param {Integer} k
# @return {Integer}
def get_winner(arr, k)
  max = arr.max
  return max if k >= arr.index(max)
  hash = {}
  loop do
    return arr[0] if hash[arr[0]] == k
    return arr[0] if arr[0] == max
    if arr[0] < arr[1]
      hash[arr[1]] = hash[arr[1]].to_i + 1
      arr << arr.shift
    else
      hash[arr[0]] = hash[arr[0]].to_i + 1
      arr << arr[1]
      tmp = arr.shift
      arr[0] = tmp
    end
  end
end
