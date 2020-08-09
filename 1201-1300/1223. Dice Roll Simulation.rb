MOD = 10**9 + 7

# @param {Integer} n
# @param {Integer[]} roll_max
# @return {Integer}
def die_simulator(n, roll_max)
  f, sum = [], []
  (1..n).each do |i|
    f[i] ||= []
    if i == 1
      (0..5).each { |j| f[i][j] = 1 }
    else
      (0..5).each do |j|
        f[i][j] = 0
        (1..roll_max[j]).each do |k|
          if i-k > 0
            f[i][j] += sum[i-k] - f[i-k][j].to_i
          elsif i-k == 0
            f[i][j] += 1
          end
        end
      end
    end
    sum[i] = f[i].sum
  end
  sum[n] % MOD
end
