# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
  length = 0
  stack = []
  tmp = head
  while tmp
    length += 1
    stack << tmp
    tmp = tmp.next
  end
  return head if length == 0

  mid = length / 2
  tmp = head
  mid.times do
    ele = tmp.next
    tmp.next = stack.pop
    tmp.next.next = ele
    tmp = ele
  end
  tmp.next = nil

  head
end
