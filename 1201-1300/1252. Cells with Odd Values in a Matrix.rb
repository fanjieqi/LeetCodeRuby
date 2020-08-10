# @param {Integer} n
# @param {Integer} m
# @param {Integer[][]} indices
# @return {Integer}
def odd_cells(n, m, indices)
  rows, cols = [], []
  indices.each { |i, j| rows[i] = rows[i].to_i + 1; cols[j] = cols[j].to_i + 1}
  count = 0
  (0..n-1).each do |i|
    (0..m-1).each do |j|
      tmp = rows[i].to_i + cols[j].to_i
      count += 1 if tmp.odd?
    end
  end
  count
end
