# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

def get_length(head)
  return 0 if head.nil?
  length = 1
  tmp = head
  while tmp.next
    length += 1
    tmp = tmp.next
  end
  length
end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def rotate_right(head, k)
  return head if head.nil? || k == 0
  length = get_length(head)
  k %= length

  tail = head
  tail = tail.next while tail.next

  i = 1
  tmp = head
  while i < (length - k)
    i += 1
    tmp = tmp.next
  end

  tail.next = head
  head = tmp.next
  tmp.next = nil

  head
end
