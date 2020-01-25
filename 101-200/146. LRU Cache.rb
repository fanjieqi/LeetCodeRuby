class LRUCache

=begin
    :type capacity: Integer
=end
    def initialize(capacity)
      @capacity = capacity
      @used_at = 0
      @hash = {}
    end


=begin
    :type key: Integer
    :rtype: Integer
=end
    def get(key)
      @hash[key][:used_at] = (@used_at += 1)
      @hash[key][:value]
    rescue => e
      -1
    end


=begin
    :type key: Integer
    :type value: Integer
    :rtype: Void
=end
    def put(key, value)
      if @hash[key]
        @hash.delete(key)
      elsif @capacity > 0
        @capacity -= 1
      else
        min = @hash.values.map{|v| v[:used_at]}.min
        k = @hash.find{|k, v| v[:used_at] == min }.first
        @hash.delete(k)
      end
      @hash[key] = {value: value, used_at: @used_at+=1}
      nil
    end


end

# Your LRUCache object will be instantiated and called as such:
# obj = LRUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)
