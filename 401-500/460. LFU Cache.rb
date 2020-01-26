class LFUCache

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
      @hash[key][:used] += 1
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
        # @hash.delete(key)
      elsif @capacity > 0
        @capacity -= 1
      else
        min = @hash.values.map{|v| v[:used]}.min
        arr = @hash.select{|k, v| v[:used] == min }
        min_at = arr.map{|k, v| v[:used_at] }.min
        k = arr.find{|k, v| v[:used] == min && v[:used_at] == min_at }&.first
        return nil if k.nil?
        @hash.delete(k)
      end
      @hash[key] ||= {used: 0}
      @hash[key][:value] = value
      @hash[key][:used] += 1
      @hash[key][:used_at] = @used_at+=1
      nil
    end


end

# Your LFUCache object will be instantiated and called as such:
# obj = LFUCache.new(capacity)
# param_1 = obj.get(key)
# obj.put(key, value)
