# @param {String} preorder
# @return {Boolean}
def is_valid_serialization(preorder)
  return true if preorder == "#"
  nodes = preorder.split(",")
  return false if nodes[0] == "#"
  stack = [0]
  left = []
  right = []
  (1..nodes.length-1).each do |i|
    stack.pop while !stack.empty? && right[stack.last]
    return false if stack.empty?
    if left[stack.last].nil?
      left[stack.last] = true
      stack << i if nodes[i] != "#"
    elsif right[stack.last].nil?
      right[stack.last] = true
      nodes[i] != "#" ? stack << i : stack.pop
    else
      return false
    end
  end
  stack.pop while !stack.empty? && right[stack.last]
  stack.empty?
end
