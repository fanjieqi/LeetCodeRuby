MOD = 10**9 + 7
COLORS = %w(ryr ryg rgr rgy yry yrg ygr ygy gry grg gyr gyg)

# @param {Integer} n
# @return {Integer}
def num_of_ways(n)
  map = {}
  COLORS.each_with_index do |color1, i|
    map[i] ||= {}
    COLORS.each_with_index do |color2, j|
      map[i][j] = true if (0..2).all? { |k| color1[k] != color2[k] }
    end
  end
  f = [{}, (0..11).map{ |i| [i, 1] }.to_h ]
  (2..n).each do |i|
    f[i] ||= {}
    (0..11).each do |j|
      f[i][j] ||= 0
      map[j].each do |k, _|
        f[i][j] += f[i-1][k]
      end
      f[i][j] %= MOD
    end
  end
  f[-1].values.sum % MOD
end
