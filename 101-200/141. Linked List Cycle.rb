# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
  slow = head
  fast = head.next
  while slow != fast
    slow = slow.next
    fast = fast.next.next
  end
  true
rescue => e
  false
end
