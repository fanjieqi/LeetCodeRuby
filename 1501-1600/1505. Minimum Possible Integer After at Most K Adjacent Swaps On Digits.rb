# @param {String} num
# @param {Integer} k
# @return {String}
def min_integer(num, k)
  return num if k <= 0
  n = num.size
  return num.chars.sort.join if k >= n*(n-1)/2

  ('0'..'9').each do |char|
    j = num.index(char)
    return num[j] + min_integer(num[0, j] + num[j+1..-1], k-j) if j && 0 <= j && j <= k
  end
end
