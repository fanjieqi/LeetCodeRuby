def init_variables
  $area_index = [
    [0,0,0,1,1,1,2,2,2],
    [0,0,0,1,1,1,2,2,2],
    [0,0,0,1,1,1,2,2,2],
    [3,3,3,4,4,4,5,5,5],
    [3,3,3,4,4,4,5,5,5],
    [3,3,3,4,4,4,5,5,5],
    [6,6,6,7,7,7,8,8,8],
    [6,6,6,7,7,7,8,8,8],
    [6,6,6,7,7,7,8,8,8],
  ]

  $anti_area = {
    0 => [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]],
    1 => [[0,3],[0,4],[0,5],[1,3],[1,4],[1,5],[2,3],[2,4],[2,5]],
    2 => [[0,6],[0,7],[0,8],[1,6],[1,7],[1,8],[2,6],[2,7],[2,8]],
    3 => [[3,0],[3,1],[3,2],[4,0],[4,1],[4,2],[5,0],[5,1],[5,2]],
    4 => [[3,3],[3,4],[3,5],[4,3],[4,4],[4,5],[5,3],[5,4],[5,5]],
    5 => [[3,6],[3,7],[3,8],[4,6],[4,7],[4,8],[5,6],[5,7],[5,8]],
    6 => [[6,0],[6,1],[6,2],[7,0],[7,1],[7,2],[8,0],[8,1],[8,2]],
    7 => [[6,3],[6,4],[6,5],[7,3],[7,4],[7,5],[8,3],[8,4],[8,5]],
    8 => [[6,6],[6,7],[6,8],[7,6],[7,7],[7,8],[8,6],[8,7],[8,8]],
  }

  $row = (0..8).map{ ("1".."9").to_a }
  $col = (0..8).map{ ("1".."9").to_a }
  $area = (0..8).map{ ("1".."9").to_a }
  $matrix = (0..8).map{(0..8).map{("1".."9").to_a}}
end

def check(board)
  board.all? { |row| row.all? { |ele| ele.length == 1 }}
end

def init_matrix(board)
  board.each_with_index do |r1,i|
    r1.each_with_index do |ele,j|
      if ele == '.'
        $matrix[i][j] = ("1".."9").to_a
      else
        $matrix[i][j] = [ele]
      end
    end
  end
end

def check_cross(i, j, k, tmp)
  $anti_area[k].each do |i1, j1|
    next if i1 == i || j1 == j
    tmp -= $row[i1]
    tmp -= $col[j1]
  end
  $matrix[i][j] = tmp if tmp.length == 1
end

def clear_relative(i, j, k, ele)
  $row[i].delete(ele)
  $col[j].delete(ele)
  $area[k].delete(ele)
  (0..8).each { |j| $matrix[i][j].delete(ele) if $matrix[i][j].length > 1 }
  (0..8).each { |i| $matrix[i][j].delete(ele) if $matrix[i][j].length > 1 }
  $anti_area[k].each { |i,j| $matrix[i][j].delete(ele) if $matrix[i][j].length > 1 }
end

# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve_sudoku(board)
  init_variables()
  init_matrix(board)
  min_length = 1 << 31
  while !check($matrix)
    rest = $matrix.flatten.flatten.length
    break if rest == min_length
    min_length = [min_length, rest].min
    $matrix.each_with_index do |r1, i|
      r1.each_with_index do |ele, j|
        k = $area_index[i][j]
        tmp = ele & $row[i] & $col[j] & $area[k]
        if tmp.length == 1
          $matrix[i][j] = tmp
          clear_relative(i, j, k, tmp.first)
        elsif tmp.length > 1
          $matrix[i][j] = tmp
          check_cross(i, j, k, tmp)
        end
      end
    end
  end

  dfs()

  board.each_with_index do |row, i|
    row.each_with_index do |ele, j|
      board[i][j] = $matrix[i][j].first.clone if $matrix[i][j].length == 1
    end
  end

  board
end

def check_ele(i, j ,ele)
  (0..8).any?{|k| (k != j && $matrix[i][k] == [ele]) || (k != i && $matrix[k][j] == [ele]) } || \
  $anti_area[$area_index[i][j]].any?{|i1, j1| (i1 != i || j1 != j) && $matrix[i1][j1] == [ele] }
end

def check_matrix_sum
  $matrix.flatten.flatten.map(&:to_i).sum == 9 * 45
end

def get_x_y
  (0..8).each do |i|
    (0..8).each do |j|
      return [i, j] if $matrix[i][j].length > 1
    end
  end
  [nil, nil]
end

def dfs
  i, j = get_x_y
  return check_matrix_sum if i.nil? && j.nil?
  tmp = $matrix[i][j]
  tmp.each do |option|
    next if check_ele(i, j, option)
    $matrix[i][j] = [option]
    return true if dfs
  end
  $matrix[i][j] = tmp
  false
end
