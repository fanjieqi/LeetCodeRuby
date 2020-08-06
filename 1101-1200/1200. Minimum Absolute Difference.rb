# @param {Integer[]} arr
# @return {Integer[][]}
def minimum_abs_difference(arr)
  arr.sort!
  min, hash = arr[1] - arr[0], {}
  hash[min] = [[arr[0], arr[1]]]
  (1..arr.size-2).each do |i|
    tmp = arr[i+1] - arr[i]
    next if tmp > min
    min = tmp
    hash[tmp] ||= []
    hash[tmp] << [arr[i], arr[i+1]]
  end
  hash[min]
end
