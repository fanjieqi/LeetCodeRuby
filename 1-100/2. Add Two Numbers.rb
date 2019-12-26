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
def add_two_numbers(l1, l2)
  tmp = 0
  head = l1
  while true
    l1.val += l2.val + tmp
    tmp = l1.val / 10
    l1.val = l1.val % 10
    if !l1.next && !l2.next && tmp.zero?
      break
    else 
      l2.next = ListNode.new(0) if !l2.next
      l1.next = ListNode.new(0) if !l1.next
    end
    l1 = l1.next
    l2 = l2.next
  end
  head
end
