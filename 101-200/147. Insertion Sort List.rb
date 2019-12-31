# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

def insert_list(head, node)
  if node.val < head.val
    node.next = head
    node
  else
    tmp = head
    tmp = tmp.next while tmp.next && tmp.next.val < node.val
    node.next = tmp.next
    tmp.next = node
    head
  end
end

# @param {ListNode} head
# @return {ListNode}
def insertion_sort_list(head)
  return head if head.nil? || head.next.nil?

  h1 = head
  tmp = head.next
  head.next = nil
  while tmp
    ori = tmp.next
    tmp.next = nil
    h1 = insert_list(h1, tmp)
    tmp = ori
  end
  h1
end
