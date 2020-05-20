# @param {String} s
# @param {Integer} k
# @return {String}
def decode_at_index(s, k)
  n = 0
  s.size.times do |i|
    n = s[i][/\d/] ? (n * s[i].to_i) : (n + 1)
    if k <= n
      i.downto(0) do |j|
        if s[j][/\d/]
          n /= s[j].to_i
          k %= n
        else
          return s[j] if k ==n || k == 0
          n -= 1
        end
      end
    end
  end
end
