# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {ListNode}
def swap_pairs(head)
  return nil if head.nil?
  return head if head.next.nil?
  rest = swap_pairs(head.next.next)
  ite = head.next
  head.next = rest
  ite.next = head
  ite
end
