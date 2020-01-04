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
  queue = Queue.new
  queue << root
  ans = []
  while !queue.empty?
    node = queue.pop
    ans << (node.nil? ? nil : node.val)
    if node
      queue << node.left
      queue << node.right
    end
  end
  ans.to_s.gsub(" ", "").gsub("nil", "null").gsub(/(\,null)+\]$/,"]")
end

# Decodes your encoded data to tree.
#
# @param {string} data
# @return {TreeNode}
def deserialize(data)
  data = data[1..-2].split(",").map {|val| val == "null" ? nil : TreeNode.new(val.to_i)}
  queue = Queue.new
  root = data.shift
  queue << root
  while !data.empty?
    node = queue.pop
    left = data.shift
    right = data.shift
    if left
      node.left = left
      queue << left
    end
    if right
      node.right = right
      queue << right
    end
  end
  root
end


# Your functions will be called as such:
# deserialize(serialize(data))
