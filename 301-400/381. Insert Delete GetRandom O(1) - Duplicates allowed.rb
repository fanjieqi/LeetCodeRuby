class RandomizedCollection

=begin
    Initialize your data structure here.
=end
    def initialize()
      @hash = {}
      @count = 0
    end


=begin
    Inserts a value to the collection. Returns true if the collection did not already contain the specified element.
    :type val: Integer
    :rtype: Boolean
=end
    def insert(val)
      @count += 1
      if @hash[val].nil?
        @hash[val] = [val]
        true
      else
        @hash[val] << val
        false
      end
    end


=begin
    Removes a value from the collection. Returns true if the collection contained the specified element.
    :type val: Integer
    :rtype: Boolean
=end
    def remove(val)
      if @hash[val]
        if @hash[val].length == 1
          @hash.delete(val)
        else
          @hash[val].pop
        end
        @count -= 1
        true
      else
        false
      end
    end


=begin
    Get a random element from the collection.
    :rtype: Integer
=end
    def get_random()
      @hash.values.flatten.sample
    end


end

# Your RandomizedCollection object will be instantiated and called as such:
# obj = RandomizedCollection.new()
# param_1 = obj.insert(val)
# param_2 = obj.remove(val)
# param_3 = obj.get_random()
