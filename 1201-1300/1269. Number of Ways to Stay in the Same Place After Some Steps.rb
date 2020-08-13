MOD = 10**9 + 7
# @param {Integer} steps
# @param {Integer} arr_len
# @return {Integer}
def num_ways(steps, arr_len)
  f, k = [], 0
  (0..steps-1).each do |i|
    f[k] ||= []
    (0..[arr_len-1, i+1].min).each do |j|
      if i == 0
        f[k] = [1, 1]
      elsif j == arr_len-1
        f[k][j] = f[1-k][j].to_i + f[1-k][j-1].to_i
      elsif j == 0
        f[k][j] = f[1-k][j].to_i + f[1-k][j+1].to_i
      else
        f[k][j] = f[1-k][j].to_i + f[1-k][j-1].to_i + f[1-k][j+1].to_i
      end
    end
    k = 1-k
  end
  f[1-k][0] % MOD
end
