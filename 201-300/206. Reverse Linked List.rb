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
def reverse_list(head)
  stack = []
  tmp = head
  while tmp
    stack << tmp.val
    tmp = tmp.next
  end
  tmp = head
  while tmp
    tmp.val = stack.pop
    tmp = tmp.next
  end
  head
end
