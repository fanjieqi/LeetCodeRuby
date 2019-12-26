# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

def build_list(nodes)
  return nil if nodes.length == 0
  list = ListNode.new(nodes.last)
  ite = list
  i = nodes.length - 2
  while i>=0
    ite.next = ListNode.new(nodes[i])
    ite = ite.next
    i -= 1
  end
  list
end

# @param {ListNode} head
# @param {Integer} k
# @return {ListNode}
def reverse_k_group(head, k)
  return nil if head.nil?
  return head if k == 1
  stack = []
  i = 0
  ite = head
  list = ListNode.new(nil)
  l_ite = list
  while ite
    stack << ite.val
    ite = ite.next
    i += 1
    if i == k
      l_ite.next = build_list(stack)
      l_ite = l_ite.next while l_ite.next
      stack = []
      i = 0
    end
  end
  l_ite.next = build_list(stack.reverse)
  list.next
end
