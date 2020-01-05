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
def odd_even_list(head)
  return head if head.nil? || head.next.nil?
  odds = head
  evens = head.next
  tail = evens
  tmp = evens.next
  is_odd = true
  while tmp
    if is_odd
      odds.next = tmp
      odds = odds.next
    else
      evens.next = tmp
      evens = evens.next
    end
    is_odd = !is_odd
    tmp = tmp.next
  end
  evens.next = nil
  odds.next = tail
  head
end
