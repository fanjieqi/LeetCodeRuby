# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} t
# @return {String}
def tree2str(t)
  t.nil? ? "" : (t.val.to_s + "(#{tree2str(t.left)})" + "(#{tree2str(t.right)})").gsub('()()','').gsub(')()',')')
end
