# @param {Integer} num
# @return {Integer[]}
def count_bits(num)
  ans = [0, 1]
  tmp = 1
  while ans.length < num + 1
    ans += ans[-tmp..-1]
    ans += ans[-tmp..-1].map{|i| i+1}
    tmp *= 2
  end
  ans[0..num]
end
