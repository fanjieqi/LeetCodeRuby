MOD = 10**9 + 7
# @param {Integer} n
# @param {Integer} m
# @param {Integer} k
# @return {Integer}
def num_of_arrays(n, m, k)
  f = []
  (1..n).each do |i|
    f[i] ||= []
    (1..m).each do |j|
      f[i][j] ||= []
      f[1][j][1] ||= 1
      (1..k).each do |l|
        f[i][j][l] ||= 0

        sum = j * f.dig(i-1, j, l).to_i % MOD
        (1..j-1).each do |m|
          sum += f.dig(i-1, m, l-1).to_i % MOD
        end
  
        f[i][j][l] += sum % MOD
      end
    end
  end
  (1..m).inject(0) { |sum, i| sum + f[n][i][k] } % MOD
end
