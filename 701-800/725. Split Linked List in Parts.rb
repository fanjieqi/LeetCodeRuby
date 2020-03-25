# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} root
# @param {Integer} k
# @return {ListNode[]}
def split_list_to_parts(root, k)
  array = []
  while root
    array << root.val
    root = root.next
  end

  ans = []
  k.times do |i|
    if i == k
      ans << array
    else
      size = (array.size / (k-i).to_f).ceil
      ans << array[0, size]
      array = array[size..-1]
    end
  end
  ans
end
