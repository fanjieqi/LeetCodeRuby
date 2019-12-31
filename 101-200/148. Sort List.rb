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
def sort_list(head)
  arr = []
  tmp = head
  while tmp
    arr << tmp.val
    tmp = tmp.next
  end
  tmp = head
  arr.sort.each do |val|
    tmp.val = val
    tmp = tmp.next
  end
  head
end
