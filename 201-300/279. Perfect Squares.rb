# @param {Integer} n
# @return {Integer}
def num_squares(n)
  f = [0]
  (1..n).each do |i|
    f[i] = i
    (1..Math.sqrt(i).ceil).each do |j|
      break if i < j**2
      f[i] = [f[i], f[i-j**2]+1].min
    end
  end
  f[n]
end
