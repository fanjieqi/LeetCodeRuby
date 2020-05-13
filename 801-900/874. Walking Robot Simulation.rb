DIRECTIONS = {
  north: %i(west east),
  east: %i(north south),
  south: %i(east west),
  west: %i(south north),
}

# @param {Integer[]} commands
# @param {Integer[][]} obstacles
# @return {Integer}
def robot_sim(commands, obstacles)
  row, col = {}, {}
  obstacles.each do |x, y|
    col[x] ||= []
    col[x] << y
    row[y] ||= []
    row[y] << x
  end
  col.keys.each { |x| col[x].sort! }
  row.keys.each { |y| row[y].sort! }

  x, y, direction, max = 0, 0, :north, 0
  commands.each_with_index do |command, k|
    if command.negative?
      direction = DIRECTIONS[direction][command]
    else
      case direction
      when :north
        i = col[x].to_a.bsearch_index { |ele| ele >= y }
        i += 1 if i && col[x][i] == y
        y += command
        y = col[x][i] - 1 if (i && col[x][i] && col[x][i] <= y)
      when :east
        i = row[y].to_a.bsearch_index { |ele| ele >= x }
        i += 1 if i && row[y][i] == x
        x += command
        x = row[y][i] - 1 if (i && row[y][i] && row[y][i] <= x)
      when :south
        i = col[x].to_a.bsearch_index { |ele| ele >= y }
        y -= command
        if (i && i > 0 && col[x][i-1] >= y)
          y = col[x][i-1] + 1
        elsif i.nil? && col.dig(x, -1) && col.dig(x, -1) >= y
          y = col.dig(x, -1) + 1
        end
      when :west
        i = row[y].to_a.bsearch_index { |ele| ele >= x }
        x -= command
        if (i && i > 0 && row[y][i-1] >= x)
          x = row[y][i-1] + 1
        elsif i.nil? && row.dig(y, -1) && row.dig(y, -1) >= x
          x = row.dig(y, -1) + 1
        end
      end
      dis = x**2 + y**2
      max = dis if dis > max
    end
  end
  max
end
