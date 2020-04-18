# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} head
# @param {Integer[]} g
# @return {Integer}
def num_components(head, g)
  hash = g.map { |i| [i, true] }.to_h
  count = 0
  while head
    count += 1 if hash[head.val]
    head = head.next while head.next && hash[head.val] && hash[head.next&.val]
    head = head.next
  end
  count
end
