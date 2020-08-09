# @param {Integer[][]} queens
# @param {Integer[]} king
# @return {Integer[][]}
def queens_attackthe_king(queens, king)
  array = []
  queens.each do |x, y|
    array[0] = [x, y] if x == king[0] && y < king[1] && (array[0].nil? || y > array[0][1])
    array[1] = [x, y] if x == king[0] && y > king[1] && (array[1].nil? || y < array[1][1])
    
    array[2] = [x, y] if x < king[0] && y == king[1] && (array[2].nil? || x > array[2][0])
    array[3] = [x, y] if x > king[0] && y == king[1] && (array[3].nil? || x < array[3][0])

    array[4] = [x, y] if x < king[0] && (x - y == king[0] - king[1]) && (array[4].nil? || y > array[4][1])
    array[5] = [x, y] if x > king[0] && (x - y == king[0] - king[1]) && (array[5].nil? || y < array[5][1])

    array[6] = [x, y] if y < king[1] && (x + y == king[0] + king[1]) && (array[6].nil? || x < array[6][0])
    array[7] = [x, y] if y > king[1] && (x + y == king[0] + king[1]) && (array[7].nil? || x > array[7][0])
  end
  array.compact
end
