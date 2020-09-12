MOD = 10**9 + 7

def count(s)
  return @count_h[s] if @count_h[s]
	ans = 0
  s.each_char do |char|
    ans = (26*ans + char.ord - 'a'.ord) % MOD
  end
  @count_h[s] = (ans + 1) % MOD
end

def helper(s)
  l = s.size
  return 0 if l < @m
  return (s < @evil ? 0 : 1) if l == @m
  return @help_h[s] if @help_h[s]
  b = (s[0].ord - 'a'.ord) * helper('z' * (l-1)) % MOD + helper(s[1..-1]) % MOD
  return b if s[0, @m] < @evil

  if s[0, @m] == @evil
    a = count(s[@m..-1])
    c = helper(@evil[1..-1] + s[@m..-1]) - helper(@evil[1..-1] + 'a'*(l-@m)) + ((@evil[1..-1] + 'a'*(l-@m)).include?(@evil.to_s) ? 1 : 0)
  else
    a = @power[l - @m]
    c = helper(@evil[1..-1] + 'z'*(l-@m)) - helper(@evil[1..-1] + 'a'*(l-@m)) + ((@evil[1..-1] + 'a'*(l-@m)).to_s.include?(@evil.to_s) ? 1 : 0)
  end
  @help_h[s] = (a + b - c) % MOD
end

# @param {Integer} n
# @param {String} s1
# @param {String} s2
# @param {String} evil
# @return {Integer}
def find_good_strings(n, s1, s2, evil)
  @evil, @m = evil, evil.size
  @count_h, @help_h = {}, {}

  @power = [1]
  n.times do
    @power << (@power[-1]*26) % MOD
  end

  ans = count(s2) - helper(s2) - (count(s1) - helper(s1))
  ans += 1 if s1[evil].nil?
  ans % MOD
end
