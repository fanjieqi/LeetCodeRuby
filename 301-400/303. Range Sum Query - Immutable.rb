class NumArray

=begin
    :type nums: Integer[]
=end
    def initialize(nums)
      @nums = nums
      @sum = [@nums[0]]
      (1..@nums.length-1).each {|i| @sum[i] = @sum[i-1] + @nums[i]}
    end


=begin
    :type i: Integer
    :type j: Integer
    :rtype: Integer
=end
    def sum_range(i, j)
      @sum[j] - @sum[i] + @nums[i]
    end


end

# Your NumArray object will be instantiated and called as such:
# obj = NumArray.new(nums)
# param_1 = obj.sum_range(i, j)
