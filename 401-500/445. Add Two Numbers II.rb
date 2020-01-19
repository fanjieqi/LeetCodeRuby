# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  s2 = []
  t2 = l2
  while t2
    s2 << t2.val
    t2 = t2.next
  end

  s1 = []
  t1 = l1
  while t1
    s1 << t1.val
    t1 = t1.next
  end

  s = (s1.join.to_i+s2.join.to_i).to_s
  l = nil
  (s.length-1).downto(0) do |i|
    tmp = ListNode.new(s[i].to_i)
    tmp.next = l
    l = tmp
  end
  l
end
