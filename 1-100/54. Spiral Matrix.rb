NEXT_DIRECTION = {
  right: :bottom,
  bottom: :left,
  left: :top,
  top: :right
}

# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  return [] if matrix.length == 0
  ans = []
  top, left = 0, 0
  right, bottom = matrix[0].length - 1, matrix.length - 1
  x, y = 0, 0
  direction = right > 0 ? :right : bottom > 0 ? :bottom : nil
  ans = [matrix[x][y]]
  while top <= bottom && left <= right
    case direction
    when :right then y += 1
    when :bottom then x += 1
    when :left then y -= 1
    when :top then x -= 1
    else break
    end
    break if x < top || x > bottom || y < left || y > right
    ans += [matrix[x][y]]
    if y == right && direction == :right
      top += 1
      direction = NEXT_DIRECTION[direction]
    end
    if x == bottom && direction == :bottom
      right -= 1
      direction = NEXT_DIRECTION[direction]
    end
    if y == left && direction == :left
      bottom -= 1
      direction = NEXT_DIRECTION[direction]
    end
    if x == top && direction == :top
      left += 1
      direction = NEXT_DIRECTION[direction]
    end
  end
  ans
end
