# @param {Integer[]} row
# @return {Integer}
def min_swaps_couples(row)
  row = row.each_slice(2).to_a
  count = 0
  while !row.empty?
    x, y = row.shift
    x, y = y, x if y < x
    next if (y - x == 1) && (x % 2 == 0)
    if x % 2 == 0
      i = row.index { |a, b| a==x+1 || b==x+1 }
      row[i][0] = y if row[i][0] == x+1
      row[i][1] = y if row[i][1] == x+1
      count += 1
    else
      row << [x, y]
    end
  end
  count
end
