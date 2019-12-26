# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  return l1 if l2.nil?
  return l2 if l1.nil?
  ans = ListNode.new(nil)
  ite = ans

  while l1 || l2
    while l1 && (l2.nil? || l1.val <= l2.val)
      ite.next = ListNode.new(l1.val)
      ite = ite.next
      l1 = l1.next
    end
    while l2 && (l1.nil? || l2.val <= l1.val)
      ite.next = ListNode.new(l2.val)
      ite = ite.next
      l2 = l2.next
    end
  end
  ans.next
end
