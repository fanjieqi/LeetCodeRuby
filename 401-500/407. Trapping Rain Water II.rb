class MinHeap
  def initialize()
    @heap = []
  end

  def push(k: nil, v: nil)
    @heap << {k: k, v: v}
    maintain_bottom
  end

  def pop
    return @heap.pop if @heap.length == 1
    tmp = @heap[0].clone
    @heap[0] = @heap.pop
    maintain_top
    tmp
  end

  def empty?
    @heap.length == 0
  end

  def maintain_top
    i = 0
    while i <= (@heap.length - 1) / 2
      l = i * 2 + 1
      r = i * 2 + 2
      j = @heap[r] && @heap[r][:k] < @heap[l][:k] ? r : l
      if @heap[j] && @heap[j][:k] < @heap[i][:k]
        @heap[j], @heap[i] =  @heap[i], @heap[j]
        i = j
      else
        break
      end
    end
  end

  def maintain_bottom
    i = @heap.length - 1
    while i > 0 && @heap[i][:k] < @heap[(i-1)/2][:k]
      @heap[(i-1)/2], @heap[i] = @heap[i], @heap[(i-1)/2]
      i = (i-1)/2
    end
  end
end

AROUND = [
  [0, -1],
  [0, +1],
  [-1, 0],
  [+1, 0],
]
# @param {Integer[][]} height_map
# @return {Integer}
def trap_rain_water(height_map)
  return 0 if height_map.length == 0 || height_map[0].length == 0
  m, n = height_map.length, height_map[0].length

  heap = MinHeap.new
  mark = []
  (0..m - 1).each do |x|
    mark[x] = []
    (0..n-1).each do |y|
      if x == 0 || y == 0 || x == m-1 || y == n-1
        mark[x][y] = true
        heap.push(k: height_map[x][y], v: [x, y])
      end
    end
  end
  result = 0
  while !heap.empty?
    tmp = heap.pop
    height = tmp[:k]
    x, y = tmp[:v]
    AROUND.each do |i, j|
      xx, yy = x+i, y+j
      if 0 <= xx && xx < m && 0 <= yy && yy < n && !mark[xx][yy]
        result += [0, height-height_map[xx][yy]].max
        mark[xx][yy] = true
        heap.push(k: [height_map[xx][yy], height].max, v: [xx, yy])
      end
    end
  end
  result
end
