# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  return nil if head.nil?
  len = 1
  ite = head
  while ite
    len += 1
    ite = ite.next
  end
  ite = head
  i = 1
  while i < (len - n - 1)
    ite = ite.next
    i += 1
  end
  if ite.next
    if i == (len - n - 1)
      ite.next = ite.next.next
      head
    else
      head.next
    end
  else
    nil
  end
end
