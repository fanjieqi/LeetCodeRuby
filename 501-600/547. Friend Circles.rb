AROUND = [
  [0, -1],
  [0, +1],
  [-1, 0],
  [+1, 0],
]

# @param {Integer[][]} m
# @return {Integer}
def find_circle_num(m)
  map = []
  m.each_with_index do |row, i|
    map[i] = []
    row.each_with_index do |col, j|
      map[i] << j if col == 1 && i != j
    end
  end

  color = []
  queue = Queue.new
  m.length.times { |i| color[i] = i; queue << i }

  while !queue.empty?
    i = queue.pop
    map[i].each do |j|
      if color[i] < color[j]
        color[j] = color[i]
        queue << j
      end
    end
  end
  color.uniq.count
end
