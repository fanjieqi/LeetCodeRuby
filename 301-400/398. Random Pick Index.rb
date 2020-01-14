class Solution

=begin
    :type nums: Integer[]
=end
    def initialize(nums)
      @hash = {}
      nums.each_with_index do |num, i|
        @hash[num] ||= []
        @hash[num] << i
      end
    end


=begin
    :type target: Integer
    :rtype: Integer
=end
    def pick(target)
      @hash[target].sample
    end


end

# Your Solution object will be instantiated and called as such:
# obj = Solution.new(nums)
# param_1 = obj.pick(target)
