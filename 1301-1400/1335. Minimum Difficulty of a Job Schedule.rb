# @param {Integer[]} job_difficulty
# @param {Integer} d
# @return {Integer}
def min_difficulty(job_difficulty, d)
  n, max = job_difficulty.size, 1 << 31

  f = [[max] * n + [0]]
  (1..d).each do |k|
    f[k] = [max] * n + [0]
    (0..n-k).each do |i|
      maxd = 0
      (i..n-k).each do |j|
        maxd = job_difficulty[j] if job_difficulty[j] > maxd
        tmp = maxd + f[k-1][j+1]
        f[k][i] = tmp if tmp < f[k][i]
      end
    end
  end
  f[d][0] < max ? f[d][0] : -1
end
