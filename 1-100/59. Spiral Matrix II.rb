NEXT_DIRECTION = {
  right: :bottom,
  bottom: :left,
  left: :top,
  top: :right
}

# @param {Integer} n
# @return {Integer[][]}
def generate_matrix(n)
  return [] if n == 0
  ans = []
  top, left = 0, 0
  right, bottom = n - 1, n - 1
  x, y = 0, 0
  direction = right > 0 ? :right : bottom > 0 ? :bottom : nil
  index = 1
  ans = [[index]]
  while top <= bottom && left <= right
    case direction
    when :right then y += 1
    when :bottom then x += 1
    when :left then y -= 1
    when :top then x -= 1
    else break
    end
    break if x < top || x > bottom || y < left || y > right
    index += 1
    ans[x] ||= []
    ans[x][y] = index
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
