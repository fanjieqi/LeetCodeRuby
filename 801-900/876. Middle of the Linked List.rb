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
def middle_node(head)
  stack = []
  while head
    stack << head
    head = head.next
  end
  stack[stack.size/2]
end
