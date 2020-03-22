class Solution

=begin
    :type n: Integer
    :type blacklist: Integer[]
=end
    def initialize(n, blacklist)
      @array = [ [0, n-1] ]
      blacklist.each do |num|
        i = @array.bsearch_index { |l, r| r >= num }
        l, r = @array[i]
        if l == num && r == num
          @array.delete_at(i)
        elsif l == num
          @array[i] = [l+1, r]
        elsif r == num
          @array[i] = [l, r-1]
        else
          @array[i] = [num+1, r]
          @array.insert(i, [l, num-1])
        end
      end
      @size = 0
      @array = @array.map! { |l, r| [l, r, @size += r-l+1] }
    end


=begin
    :rtype: Integer
=end
    def pick()
      tmp = rand(@size)+1
      i = @array.bsearch_index { |l, r, size| size >= tmp }
      l, r, size = @array[i]
      l + rand(r-l+1)
    end


end

# Your Solution object will be instantiated and called as such:
# obj = Solution.new(n, blacklist)
# param_1 = obj.pick()
