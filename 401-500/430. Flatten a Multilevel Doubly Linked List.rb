# Definition for a Node.
# class Node
#     attr_accessor :val, :prev, :next, :child
#     def initialize(val=nil, prev=nil, next_=nil, child=nil)
#         @val = val
#         @prev = prev
#         @next = next_
#         @child = child
#     end
# end

def preorder(root)
  return if root.nil?
  @array << root
  preorder(root.child)
  preorder(root.next)
end

# @param {Node} root
# @return {Node}
def flatten(root)
  @array = []
  preorder(root)
  (0..@array.size-1).each do |i|
    @array[i].next = @array[i+1] if i < @array.size-1
    @array[i].prev = @array[i-1] if i > 0
    @array[i].child = nil
  end
  @array[0]
end
