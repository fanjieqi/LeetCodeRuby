# @param {Integer[]} arr
# @return {Boolean}
def three_consecutive_odds(arr)
  (0..arr.size-3).any? { |i| arr[i].odd? && arr[i+1].odd? && arr[i+2].odd? }
end
