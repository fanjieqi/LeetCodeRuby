AROUND = [
  [0, 1],
  [0,-1],
  [1, 0],
  [-1,0],
  [1, 1],
  [1,-1],
  [-1,1],
  [-1,-1]
]
def count_neighbors(x, y)
  AROUND.inject(0) do |sum, ele|
    xx = x + ele[0]
    yy = y + ele[1]
    sum += xx >= 0 && xx <= @m && yy >= 0 && yy <= @n && @board[xx][yy] == 1 ? 1 : 0
  end
end

# @param {Integer[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def game_of_life(board)
  @board = board
  @m = @board.length - 1
  @n = @board[0].length - 1
  mark = []
  (0..@m).each do |x|
    mark[x] ||= []
    (0..@n).each do |y|
      count = count_neighbors(x, y)
      case count
      when 0..1 then mark[x][y] = 0
      when 2 then mark[x][y] = @board[x][y] == 1 ? 1 : 0
      when 3 then mark[x][y] = 1
      else mark[x][y] = 0
      end
    end
  end
  (0..@m).each do |x|
    (0..@n).each do |y|
      @board[x][y] = mark[x][y]
    end
  end
end
