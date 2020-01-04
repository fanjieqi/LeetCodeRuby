class NumArray

=begin
    :type nums: Integer[]
=end
    def initialize(nums)
      @nums = nums
      @sum = [@nums[0]]
      (1..@nums.length-1).each {|i| @sum[i] = @sum[i-1] + @nums[i]}
      @hash = {}
    end


=begin
    :type i: Integer
    :type val: Integer
    :rtype: Void
=end
    def update(i, val)
      @hash[i] = val
    end


=begin
    :type i: Integer
    :type j: Integer
    :rtype: Integer
=end
    def sum_range(i, j)
      @sum[j] - @sum[i] + @nums[i] + sum_updator(i, j)
    end

    def sum_updator(i, j)
      @hash.inject(0) do |sum, ele|
        sum += (i <= ele[0] && ele[0] <= j) ? (ele[1] - @nums[ele[0]]) : 0
      end
    end


end

# Your NumArray object will be instantiated and called as such:
# obj = NumArray.new(nums)
# obj.update(i, val)
# param_2 = obj.sum_range(i, j)
