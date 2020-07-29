class MajorityChecker

=begin
    :type arr: Integer[]
=end
    def initialize(arr)
      @hash, @count = {}, {}
      arr.each_with_index do |num, i|
        @hash[num] = @hash[num].to_a + [i]
        @count[num] = @count[num].to_i + 1
      end
      @array = @hash.keys.map { |num| [num, @count[num]] }.sort_by(&:last)
    end


=begin
    :type left: Integer
    :type right: Integer
    :type threshold: Integer
    :rtype: Integer
=end
    def query(left, right, threshold)
      i = @array.bsearch_index { |num, count| count >= threshold }
      return -1 if i.nil?
      @array[i..-1].find { |num, _|
        l = @hash[num].bsearch_index { |i| i >= left } || @hash[num].size-1
        r = @hash[num].bsearch_index { |i| i >= right } || @hash[num].size-1
        r -= 1 if @hash[num][r] > right
        r - l + 1 >= threshold
      }&.first || -1
    end


end

# Your MajorityChecker object will be instantiated and called as such:
# obj = MajorityChecker.new(arr)
# param_1 = obj.query(left, right, threshold)
