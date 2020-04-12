# @param {Integer[]} a
# @param {Integer[]} b
# @return {Integer}
def min_swap(a, b)
  swap, fix = 1, 0
  (1..a.size-1).each do |i|
    if a[i-1] >= b[i] || b[i-1] >= a[i]
      swap += 1
    elsif a[i-1] >= a[i] || b[i-1] >= b[i]
      tmp = swap
      swap = fix + 1
      fix = tmp
    else
      min = [swap, fix].min
      swap = min + 1
      fix = min
    end
  end
  [swap, fix].min
end
