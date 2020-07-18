MOD = (1 << 63) - 1

def rabin_karp(len)
  # t = 26.pow(len, MOD)
  t = @pows[len]
  cur = @a[0, len].inject(0) { |res, x| res = (res * 26 + x) % MOD }

  @hash = { cur => true }
  (len..@s.size-1).each do |i|
    cur = (cur * 26 + @a[i] - @a[i - len] * t) % MOD
    return i - len + 1 if @hash[cur]
    @hash[cur] = true
  end
  nil
end

# @param {String} s
# @return {String}
def longest_dup_substring(s)
  @s = s
  @a = s.chars.map { |char| char.ord - 'a'.ord }
  @pows = [1]
  (1..s.size).each { |i| @pows[i] = @pows[i-1] * 26 % MOD }

  k, l, r = 0, 0, @s.size
  while l < r
    mid = (l + r + 1) / 2
    pos = rabin_karp(mid)
    if pos
      l = mid
      k = pos
    else
      r = mid - 1
    end
  end
  s[k, l]
end
