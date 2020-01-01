# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} val
# @return {ListNode}
def remove_elements(head, val)
  head = head.next while head && head.val == val
  tmp = head
  while tmp && tmp.next
    tmp.next = tmp.next.next while tmp.next && tmp.next.val == val
    tmp = tmp.next
  end
  head
end
