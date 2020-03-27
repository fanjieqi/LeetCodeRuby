# @param {String} s
# @return {Integer}
def count_palindromic_subsequences(s)
  n = s.size
  f = n.times.map { |i| [].insert(i, 1) }
  (1..n-1).each do |distance|
    (0..n-1-distance).each do |i|
      j = i + distance
      if s[i] == s[j]
        l, r = i+1, j-1
        l += 1 while(l <= r && s[l] != s[j])
        r -= 1 while(l <= r && s[r] != s[j])
        if l > r
          f[i][j] = f[i+1][j-1].to_i*2 + 2
        elsif l == r
          f[i][j] = f[i+1][j-1].to_i*2 + 1
        else
          f[i][j] = f[i+1][j-1].to_i*2 - f[l+1][r-1].to_i
        end
      else
        f[i][j] = f[i][j-1].to_i + f[i+1][j].to_i - f[i+1][j-1].to_i
      end
      f[i][j] = f[i][j] < 0 ? f[i][j] + 1000000007 : f[i][j] % 1000000007
    end
  end
  f[0][-1]
end
