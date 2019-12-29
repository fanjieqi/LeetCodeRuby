# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer} x
# @return {ListNode}
def partition(head, x)
  return head if head.nil? || head.next.nil?
  h = head

  tmp = head
  while tmp
    break if tmp.val < x
    tmp = tmp.next
  end
  h1 = tmp
  return head if tmp.nil?

  tmp = head
  while tmp
    break if tmp.val >= x
    tmp = tmp.next
  end
  h2 = tmp
  return head if tmp.nil?

  tmp = head
  left = h1
  right = h2
  while tmp
    if tmp.val < x && tmp != h1
      h1.next = tmp
      h1 = h1.next
    elsif tmp.val >= x && tmp != h2
      h2.next = tmp
      h2 = h2.next
    end
    tmp = tmp.next
  end

  h1.next = right
  h2.next = nil
  left
end
