AROUND = [
  [0, -1],
  [0, +1],
  [-1, 0],
  [+1, 0],
]

def bfs
  while !@queue.empty?
    x, y, dis = @queue.pop
    if @map[x][y].nil? || dis < @map[x][y]
      @map[x][y] = dis
      AROUND.each do |i, j|
        @queue << [x+i, y+j, dis + 1] if 0 <= x+i && x+i < @m && 0 <= y+j && y+j < @matrix[0].length && (@map[x+i][y+j].nil? || dis+1 < @map[x+i][y+j])
      end
    end
  end
end

# @param {Integer[][]} matrix
# @return {Integer[][]}
def update_matrix(matrix)
  @map = []
  @matrix = matrix
  @m = @matrix.length 
  @n = @matrix[0].length
  @queue = Queue.new
  @m.times do |x|
    @map[x] ||= []
    @n.times do |y|
      @queue << [x, y, 0] if @matrix[x][y] == 0
    end
  end
  bfs
  @map
end
