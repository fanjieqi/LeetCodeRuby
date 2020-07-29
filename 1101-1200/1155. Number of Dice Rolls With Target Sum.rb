MOD = 10**9 + 7

# @param {Integer} d
# @param {Integer} f
# @param {Integer} target
# @return {Integer}
def num_rolls_to_target(d, f, target)
  sum = [{0=>1}]
  i = 1
  d.times do
    sum[i] = {}
    (1..f).each do |j|
      (j..target).each do |k|
        sum[i][k] = (sum[i][k].to_i + sum[1-i][k-j].to_i) % MOD
      end
    end
    i = 1-i
  end
  sum[1-i][target] || 0
end
