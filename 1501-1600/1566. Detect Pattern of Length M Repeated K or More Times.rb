# @param {Integer[]} arr
# @param {Integer} m
# @param {Integer} k
# @return {Boolean}
def contains_pattern(arr, m, k)
  str = arr.join(',')
  count, key = {}, nil
  (0..arr.size-m).each do |i|
    if i == 0
      key = arr[0, m]
    else
      key.shift
      key << arr[i+m-1]
    end
    tmp = key.join(',')
    # p tmp
    return true if str[/(#{tmp}\,){#{k-1}}(#{tmp})/]
  end
  false
end
