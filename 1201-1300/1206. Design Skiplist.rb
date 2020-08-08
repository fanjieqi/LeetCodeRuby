class Skiplist
    def initialize()
      @array = []
    end


=begin
    :type target: Integer
    :rtype: Boolean
=end
    def search(target)
      i = @array.bsearch_index { |ele| ele >= target }
      !!i && @array[i] == target
    end


=begin
    :type num: Integer
    :rtype: Void
=end
    def add(num)
      i = @array.bsearch_index { |ele| ele >= num } || @array.size
      @array.insert(i, num)
    end


=begin
    :type num: Integer
    :rtype: Boolean
=end
    def erase(num)
      i = @array.bsearch_index { |ele| ele >= num }
      !!i && @array[i] == num && !!@array.delete_at(i) 
    end


end

# Your Skiplist object will be instantiated and called as such:
# obj = Skiplist.new()
# param_1 = obj.search(target)
# obj.add(num)
# param_3 = obj.erase(num)
