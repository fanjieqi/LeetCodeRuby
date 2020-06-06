MAX = 1 << 31

# @param {Integer[][]} a
# @return {Integer}
def min_falling_path_sum(a)
  a.each_with_index do |row, i|
    next if i.zero?
    row.each_with_index do |num, j|
      a[i][j] += [j > 0 ? a[i-1][j-1] : MAX, a[i-1][j], j <= row.size-2 ? a[i-1][j+1] : MAX].min
    end
  end
  a[-1].min
end
