# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} headA
# @param {ListNode} headB
# @return {ListNode}
def getIntersectionNode(headA, headB)
  @mark = { headA => true }
  while headA
    @mark[headA] = true
    headA = headA.next
  end
  while headB
    return headB if @mark[headB]
    headB = headB.next
  end
  nil
end
