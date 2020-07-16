NORTH, WEST, SOUTH, EAST = 0, 1, 2, 3

STEPS = {
  NORTH => [0, 1],
  WEST => [-1, 0],
  SOUTH => [0, -1],
  EAST => [1, 0],
}

# @param {String} instructions
# @return {Boolean}
def is_robot_bounded(instructions)
  instructions.gsub!(/(LR|RL)/, '')
  n, x, y, direcion = instructions.size, 0, 0, 0
  hash = { x => { y => {direcion => 0} } }
  4.times do
    instructions.each_char.with_index do |instruction, i|
      dx, dy = STEPS[direcion]
      case instruction
      when 'G' then x += dx; y += dy
      when 'L' then direcion = (direcion + 1) % 4
      when 'R' then direcion = (direcion - 1) % 4
      end
      hash[x] ||= {}
      hash[x][y] ||= {}
      return true if hash[x][y][direcion] && i == n-1
      hash[x][y][direcion] = true
    end
  end
  false
end
