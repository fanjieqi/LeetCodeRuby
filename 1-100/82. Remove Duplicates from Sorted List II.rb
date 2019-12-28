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
def delete_duplicates(head)
  return head if head.nil? || head.next.nil?
  ele = head.val
  flag = false
  count = 0
  while head && head.next && head.val == head.next.val
    head = head.next while head && head.next && head.val == head.next.val
    head = head.next
  end
  tmp = head

  while tmp&.next
    if tmp.next && tmp.next.next && (tmp.next.val == tmp.next.next.val)
      while tmp.next && tmp.next.next && (tmp.next.val == tmp.next.next.val)
        tmp.next = tmp.next.next
      end
      tmp.next = tmp.next.next
    else
      tmp = tmp.next
    end
  end
  head = head.next if head && head.next && (head.val == head.next.val)
  head
end
