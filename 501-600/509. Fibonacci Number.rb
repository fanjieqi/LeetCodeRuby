# @param {Integer} n
# @return {Integer}
def fib(n)
  return n if n <= 1
  a, b, c = 0, 1, 0
  (2..n).each do |i|
    c = a + b
    a = b
    b = c
  end
  c
end
