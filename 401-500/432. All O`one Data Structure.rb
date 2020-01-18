class AllOne

=begin
    Initialize your data structure here.
=end
    def initialize()
      @hash = {}
      @array = []
    end


=begin
    Inserts a new key <Key> with value 1. Or increments an existing key by 1.
    :type key: String
    :rtype: Void
=end
    def inc(key)
      if @hash[key]
        @hash[key][:v] += 1
        maintain_max(key)
      else
        @array << key
        @hash[key] = {v: 1, i: @array.length-1}
        maintain_min(key)
      end
      nil
    end


=begin
    Decrements an existing key by 1. If Key's value is 1, remove it from the data structure.
    :type key: String
    :rtype: Void
=end
    def dec(key)
      return nil unless @hash[key]
      if @hash[key][:v] == 1
        i = @hash.delete(key)[:i]
        @array.delete_at(i)
        @array[i..-1].each {|key| @hash[key][:i] -= 1}
      else
        @hash[key][:v] -= 1
        maintain_min(key)
      end
      nil
    end


=begin
    Returns one of the keys with maximal value.
    :rtype: String
=end
    def get_max_key()
      @array.last || ""
    end


=begin
    Returns one of the keys with Minimal value.
    :rtype: String
=end
    def get_min_key()
      @array.first || ""
    end

    def maintain_min(key)
      i = @hash[key][:i]
      while i > 0 && @hash[key][:v] < @hash[@array[i-1]][:v]
        @hash[@array[i-1]][:i] += 1
        @array[i], @array[i-1] = @array[i-1], @array[i]
        @hash[key][:i] -=1
        i -= 1
      end
    end

    def maintain_max(key)
      i = @hash[key][:i]
      while i < @array.length-1 && @hash[key][:v] > @hash[@array[i+1]][:v]
        @hash[@array[i+1]][:i] -= 1
        @array[i], @array[i+1] = @array[i+1], @array[i]
        @hash[key][:i] +=1
        i += 1
      end
    end
end

# Your AllOne object will be instantiated and called as such:
# obj = AllOne.new()
# obj.inc(key)
# obj.dec(key)
# param_3 = obj.get_max_key()
# param_4 = obj.get_min_key()
