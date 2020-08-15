# @param {Integer[]} arr
# @return {Integer[]}
def replace_elements(arr)
  n = arr.size
  max = arr[-1]
  (n-1).downto(0) do |i|
    tmp = arr[i]
    if i == n-1
      arr[i] = -1
    else
      arr[i] = max
    end
    max = tmp if tmp > max
  end
  arr
end
