# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Integer[]}
def next_larger_nodes(head)
  return [] if head.nil?
  ans, stack = [], []
  i = -1
  while head
    ans[stack.pop[1]] = head.val while !stack.empty? && head.val > stack.last[0]
    stack << [head.val, i+=1]
    head = head.next
  end
  ans[stack.pop[1]] = 0 while !stack.empty?
  ans
end
