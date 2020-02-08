class Solution

=begin
    :type w: Integer[]
=end
    def initialize(w)
      @sum = []
      w.each_with_index{|x, i| @sum[i] = @sum[i-1].to_i + x}
      @max = @sum.last
    end


=begin
    :rtype: Integer
=end
    def pick_index()
      tmp = rand(@max)
      @sum.bsearch_index{|x| x > tmp }
    end

end

# Your Solution object will be instantiated and called as such:
# obj = Solution.new(w)
# param_1 = obj.pick_index()
