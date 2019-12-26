# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end
s
# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  return nil if lists.all?(&:nil?)
  ans = ListNode.new(nil)
  ite = ans
  arr = []
  lists.each do |list|
    while list
      arr << list.val
      list = list.next
    end
  end
  ite = ans
  arr.sort.each do |ele|
    ite.next = ListNode.new(ele)
    ite = ite.next
  end
  ans.next
end
