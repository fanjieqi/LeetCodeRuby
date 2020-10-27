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
def detectCycle(head)
  tmp = head
  @mark = { tmp => true }
  while tmp && tmp.next
    tmp = tmp.next
    return tmp if @mark[tmp]
    @mark[tmp] = true
  end
  nil
end
