# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

class Solution

=begin
    @param head The linked list's head.
        Note that the head is guaranteed to be not null, so it contains at least one node.
    :type head: ListNode
=end
    def initialize(head)
      @head = head
      @cur = @head
      @tail = head
      @count = 1 if @head
      while @tail.next
        @tail = @tail.next
        @count += 1
      end
      @tail.next = @head
    end


=begin
    Returns a random node's value.
    :rtype: Integer
=end
    def get_random()
      rand(@count).times { @cur = @cur.next }
      @cur.val
    end


end
  
# Your Solution object will be instantiated and called as such:
# obj = Solution.new(head)
# param_1 = obj.get_random()
