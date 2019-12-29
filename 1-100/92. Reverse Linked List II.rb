# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} m
# @param {Integer} n
# @return {ListNode}
def reverse_between(head, m, n)
  count = n - m + 1

  tail = head
  (m-2).times { tail = tail.next }
  h1 = m == 1 ? tail : tail.next

  h2 = head
  (n-1).times { h2 = h2.next }

  while (count -= 1) >= 0
    tmp = h1
    h1 = h1.next
    tmp.next = h2.next
    h2.next = tmp
  end
  h2.next = h1
  if m == 1
    head = h2
  else
    tail.next = h2
  end

  head
end
