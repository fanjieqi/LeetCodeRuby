class KthLargest

=begin
    :type k: Integer
    :type nums: Integer[]
=end
    def initialize(k, nums)
      @k = k
      @nums = nums.sort
    end


=begin
    :type val: Integer
    :rtype: Integer
=end
    def add(val)
      i = @nums.bsearch_index {|ele| ele >= val} || -1
      @nums.insert(i, val)
      @nums[-@k]
    end


end

# Your KthLargest object will be instantiated and called as such:
# obj = KthLargest.new(k, nums)
# param_1 = obj.add(val)
