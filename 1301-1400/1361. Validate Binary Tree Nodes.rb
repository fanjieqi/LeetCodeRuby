# @param {Integer} n
# @param {Integer[]} left_child
# @param {Integer[]} right_child
# @return {Boolean}
def validate_binary_tree_nodes(n, left_child, right_child)
  lefts = left_child.reject(&:negative?)
  rights = right_child.reject(&:negative?)
  leaves = (0..n-1).select { |i| left_child[i] == -1 && right_child[i] == -1 }
  n == 1 || (lefts & rights).empty? && (n - (lefts | rights).size) == 1 && !((lefts | rights) & leaves).empty?
end
