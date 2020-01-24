# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end


# Encodes a tree to a single string.
#
# @param {TreeNode} root
# @return {string}
def serialize(root)
  nodes = [root]
  i = 0
  while i < nodes.length
    node = nodes[i]
    if node
      nodes << node.left
      nodes << node.right
    end
    i += 1
  end
  ans = nodes.map {|node| node ? node.val : ""}.join(",")
  ans.gsub(/,+$/, "")
end

# Decodes your encoded data to tree.
#
# @param {string} data
# @return {TreeNode}
def deserialize(data)
  nums = data.split(",")
  roots = []
  is_left = nil
  while !nums.empty?
    val = nums.shift
    if is_left.nil?
      node = TreeNode.new(val)
      root = node
    else
      if is_left
        if val != ""
          node.left = TreeNode.new(val)
          roots << node.left
        end
      else
        if val != ""
          node.right = TreeNode.new(val)
          roots << node.right
        end
        node = roots.shift
      end
    end
    is_left = !is_left
  end
  root
end


# Your functions will be called as such:
# deserialize(serialize(data))
