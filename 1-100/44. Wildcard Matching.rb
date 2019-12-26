# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  f = [[]]
  f[0][0] = true
  f[s.length] ||= []

  (1..p.length).each do |j|
    f[0] ||= []
    f[0][j] = f[0][j - 1] if p[j - 1] == '*'
  end

  (1..s.length).each do |i|
    (1..p.length).each do |j|
      f[i] ||= []
      f[i][j] = f[i - 1][j - 1] if p[j - 1] == s[i - 1] || p[j - 1] == '?'
      f[i][j] = f[i - 1][j] || f[i][j - 1] if p[j - 1] == '*'
    end
  end

  !f[s.length][p.length].nil?
end
