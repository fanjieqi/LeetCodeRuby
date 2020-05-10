# @param {Integer[][]} a
# @return {Integer[][]}
def transpose(a)
  b = []
  (0..a.size-1).each do |i|
    b[i] ||= []
    (0..a[0].size-1).each do |j|
      b[j] ||= []
      b[i][j] = a.dig(j, i)
      b[j][i] = a.dig(i, j)
    end
  end
  b.map(&:compact).reject(&:empty?)
end
