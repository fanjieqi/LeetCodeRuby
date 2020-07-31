# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def remove_zero_sum_sublists(head)
  node = head
  hash, stack = {}, []
  while node
    node = node.next while node&.val == 0
    break if node.nil?
    if hash[-node.val]
      prefix = hash.delete(-node.val)
      true while !stack.empty? && stack.pop != prefix
    else
      stack << node
    end
    sum = 0
    hash = {}
    (stack.size-1).downto(0) do |i|
      sum += stack[i].val
      hash[sum] = stack[i]
    end
    node = node.next
  end
  return nil if stack.empty?
  array = stack.map { |node| ListNode.new(node.val) }
  (0..array.size-1).each { |i| array[i].next = array[i+1] }
  array[0]
end
