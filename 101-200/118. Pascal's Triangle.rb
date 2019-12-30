# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)
  return [] if num_rows == 0
  f = [[1]]
  (1..num_rows-1).each do |i|
    f[i] ||= []
    (0..i).each do |j|
      f[i][j] = (j > 0 ? f[i-1][j-1] : 0) + (j < i ? f[i-1][j] : 0)
    end
  end
  f
end
