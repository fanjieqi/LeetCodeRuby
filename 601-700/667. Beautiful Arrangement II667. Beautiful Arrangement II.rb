# @param {Integer} n
# @param {Integer} k
# @return {Integer[]}
def construct_array(n, k)
  array = (2..n).to_a
  ans = [1]
  flag = true
  (k-1).times do
    ans << (flag ? array.pop : array.shift)
    flag = !flag
  end
  ans += flag ? array : array.reverse
end
