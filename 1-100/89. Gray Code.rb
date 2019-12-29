# @param {Integer} n
# @return {Integer[]}
def gray_code(n)
  return [0] if n == 0
  return [0, 1]  if n == 1
  arr = gray_code(n-1)
  len = arr.length - 1
  l = n - 1
  arr << ((1 << l) | arr.last)
  arr += arr[0..len-1].map {|ele| (1 << l) | ele }.reverse
  arr
end
