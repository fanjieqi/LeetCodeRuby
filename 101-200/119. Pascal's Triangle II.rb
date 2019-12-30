# @param {Integer} row_index
# @return {Integer[]}
def get_row(row_index)
  f = [[1]]
  (1..row_index).each do |i|
    f[i] ||= []
    (0..i).each do |j|
      f[i][j] = (j > 0 ? f[i-1][j-1] : 0) + (j < i ? f[i-1][j] : 0)
    end
  end
  f.last
end
