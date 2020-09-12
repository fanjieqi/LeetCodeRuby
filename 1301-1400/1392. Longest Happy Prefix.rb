MOD = 10**9 + 7

# @param {String} s
# @return {String}
def longest_prefix(s)
  ans, l, r = 0, 0, 0
  basic = 1
  (0..s.size-2).each do |i|
    l = (l * 128 + s[i].ord ) % MOD
    r = (r + basic * s[-i-1].ord) % MOD
    basic = basic * 128 % MOD
    ans = i + 1 if l == r
  end
  s[0, ans]
end
