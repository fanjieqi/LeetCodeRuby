AROUND = [
  [+1, 0],
  [0, -1],
  [0, +1],
  [-1, 0],
]

def bfs(source, target)
  hash = {}
  @blocked.each {|x, y| 
    hash[x] ||= {}
    hash[x][y] = true
  }
  queue = Queue.new
  queue << source
  hash[source] = true
  i = 0
  while !queue.empty?
    x, y = queue.pop
    AROUND.each do |dx, dy|
      xx, yy = x + dx, y + dy
      return true if [xx, yy] == target
      next if xx < 0 || xx >= @n || yy < 0 || yy >= @m || hash.dig(xx, yy)
      queue << [xx, yy]
      hash[xx] ||= {}
      hash[xx][yy] = true
    end
    return true if (i += 1) >= 20000
  end
  false
end

# @param {Integer[][]} blocked
# @param {Integer[]} source
# @param {Integer[]} target
# @return {Boolean}
def is_escape_possible(blocked, source, target)
  @blocked, @n, @m = blocked, 1000000, 1000000
  bfs(source, target) && bfs(target, source)
end
