class MyCalendar
    def initialize()
      @array = []
    end


=begin
    :type start: Integer
    :type end: Integer
    :rtype: Boolean
=end
    def book(start_at, end_at)
      i = @array.bsearch_index { |s1, e1| e1 > start_at}
      if i && (@array[i] + [start_at, end_at]).sort != ([start_at, end_at] + @array[i]) && (@array[i] + [start_at, end_at]).sort != ( @array[i] + [start_at, end_at])
        false
      else
        @array.insert(i || -1, [start_at, end_at])
        true
      end
    end


end

# Your MyCalendar object will be instantiated and called as such:
# obj = MyCalendar.new()
# param_1 = obj.book(start, end)


# obj = MyCalendar.new
# p obj.book(47, 50) == true
# p obj.book(33, 41) == true
# p obj.book(39, 45) == false
# p obj.book(33, 42) == false
# p obj.book(25, 32) == true
# p obj.book(26, 35) == false
# p obj.book(19, 25) == true
# p obj.book(3, 8) == true
# p obj.book(8, 13) == true
# p obj.book(18, 27) == false

obj = MyCalendar.new
p obj.book(48,50)
p obj.book(0,6)
p obj.book(6,13)
p obj.book(8,13)
p obj.book(15,23)
p obj.book(49,50)
p obj.book(45,50)
p obj.book(29,34)
p obj.book(3,12)
p obj.book(38,44)

[null,true,true,true,false,true,false,false,true,false,true]