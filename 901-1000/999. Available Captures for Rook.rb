AROUND = [
  [+1, 0],
  [0, -1],
  [0, +1],
  [-1, 0],
]

# @param {Character[][]} board
# @return {Integer}
def num_rook_captures(board)
  x, y = nil, nil
  (0..7).each do |i|
    (0..7).each do |j|
      x, y = i,j if board[i][j] == 'R'
    end
  end

  count = 0
  AROUND.each do |dx, dy|
    xx, yy, flag = x, y, true
    while xx > 0 && xx < 7 && yy > 0 && yy < 7 && flag
      case board[xx+dx][yy+dy]
      when '.' then xx += dx; yy += dy
      when 'p' then count += 1; flag = false
      when 'B' then flag = false
      end
    end
  end
  count
end
