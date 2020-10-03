INTEGERS = ('0'..'9').to_a

# @param {String} s
# @return {Integer}
def longest_awesome(s)
  ans, cur, n = 0, 0, s.length
  hash = [-1] + [n] * (1 << 10)
  (0..n-1).each do |i|
    cur ^= (1 << s[i].to_i)
    (0..9).each do |j|
      tmp = i - hash[cur ^ (1 << j)]
      ans = tmp if tmp > ans
    end
    tmp = i - hash[cur]
    ans = tmp if tmp > ans
    hash[cur] = i if i < hash[cur]
  end
  ans
end
