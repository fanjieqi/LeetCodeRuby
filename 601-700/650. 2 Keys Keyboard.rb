# @param {Integer} n
# @return {Integer}
def min_steps(n)
  f = [0, 0]
  (2..n).each do |i|
    f[i] = i
    (1..i/2).each do |j|
      count = f[j] + (i / j)
      f[i] = count if i % j == 0 && count < f[i]
    end
  end
  f[n]
end
