TIE = -1
MOUSE = 1
CAT = 2

# @param {Integer[][]} graph
# @return {Integer}
def cat_mouse_game(graph)
  n = graph.length
  color, outdg = [], []
  n.times do |i|
    outdg[i] ||= []
    color[i] ||= []
    n.times do |j|
      color[i][j] ||= []
      outdg[i][j] = [graph[j].length, graph[i].length]
      graph[i].each do |k|
        next if k != 0
        outdg[i][j][1] -= 1
        break
      end
    end
  end

  queue = Queue.new
  (1..n-1).each do |k|
    (0..1).each do |m|
      color[k][0][m] = MOUSE
      queue << [k, 0, m, MOUSE]

      color[k][k][m] = CAT
      queue << [k, k, m, CAT]
    end
  end

  while !queue.empty?
    x, y, pos, winner = queue.pop
    return winner if x == CAT && y == MOUSE && pos == 0

    pre = 1 - pos
    graph[pre == MOUSE ? x : y].each do |prev|
      xx = pre == MOUSE ? prev : x
      yy = pre == MOUSE ? y : prev
      next if xx == 0
      next if color[xx][yy][pre].to_i > 0
      if pre == MOUSE && winner == CAT || pre == 0 && winner == MOUSE || (outdg[xx][yy][pre]-=1) == 0
        color[xx][yy][pre] = winner
        queue << [xx, yy, pre, winner]
      end
    end
  end
  color[2][1][0] || 0
end
