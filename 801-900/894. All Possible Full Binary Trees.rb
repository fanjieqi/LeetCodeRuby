# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
@hash = {}
# @param {Integer} n
# @return {TreeNode[]}
def all_possible_fbt(n)
  return @hash[n] if @hash[n]
  if n == 1
    @hash[n] = [TreeNode.new(0)]
  else
    @hash[n] = []
    (1..n-2).each do |i|
      if i.odd?
        lefts = all_possible_fbt(i)
        rights = all_possible_fbt(n-i-1)
        lefts.each do |left|
          rights.each do |right|
            node = TreeNode.new(0)
            node.left = left
            node.right = right
            @hash[n] << node
          end
        end
      end
    end
    @hash[n]
  end
end
