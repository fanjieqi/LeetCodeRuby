class DinnerPlates

=begin
    :type capacity: Integer
=end
    def initialize(capacity)
      @stacks, @left, @right, @capacity = [], [], [], capacity
    end


=begin
    :type val: Integer
    :rtype: Void
=end
    def push(val)
      if @stacks.empty?
        @stacks[0] = [val]
        if @capacity > 1
          @left[0] = 0
        else
          @right[0] = 0
        end
      else
        @left << @stacks.size if @left.empty?
        index = @left[0]
        @stacks[index] ||= []
        @stacks[index] << val
        if @stacks[index].size == @capacity
          @left.shift
          i = @right.bsearch_index { |j| j >= index } || @right.size
          @right.insert(i, index)
        end
      end
    end


=begin
    :rtype: Integer
=end
    def pop()
      if @stacks.empty?
        -1
      else
        reset_left_right(@stacks.size-1, true)
      end
    end


=begin
    :type index: Integer
    :rtype: Integer
=end
    def pop_at_stack(index)
      if @stacks[index].nil? || @stacks[index].empty?
        -1
      else
        reset_left_right(index, index == @stacks.size-1)
      end
    end

    def reset_left_right(index, is_last = false)
      tmp = @stacks[index].pop
      @stacks.pop while is_last && !@stacks.empty? && @stacks[-1].empty?
      i = @right.bsearch_index { |k| k >= index }
      if i && @right[i] == index
        @right.delete_at(i)
        if !is_last
          j = @left.bsearch_index { |k| k >= index } || @left.size
          @left.insert(j, index)
        end
      end
      tmp
    end

end

# Your DinnerPlates object will be instantiated and called as such:
# obj = DinnerPlates.new(capacity)
# obj.push(val)
# param_2 = obj.pop()
# param_3 = obj.pop_at_stack(index)
