# @param {Integer} lo
# @param {Integer} hi
# @param {Integer} k
# @return {Integer}
def get_kth(lo, hi, k)
  hash = {}
  (0..15).each do |i|
    hash[1 << i] = i
  end
  array = []
  (lo..hi).each do |num|
    stack = [num]
    while !hash[stack[-1]]
      u = stack[-1]
      if u.odd?
        u = u * 3 + 1
      else
        u /= 2
      end
      stack << u
    end
    while !stack.empty?
      tmp = stack.pop
      hash[stack[-1]] = hash[tmp] + 1 if !stack.empty?
    end
    array << [num, hash[num]]
  end
  array.sort_by { |num, tmp| [tmp, num] }[k-1][0]
end
