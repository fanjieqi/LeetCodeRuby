class TimeMap

=begin
    Initialize your data structure here.
=end
    def initialize()
      @hash = {}
    end


=begin
    :type key: String
    :type value: String
    :type timestamp: Integer
    :rtype: Void
=end
    def set(key, value, timestamp)
      @hash[key] ||= []
      index = @hash[key].bsearch_index { |(v1, t1)| t1 >= -timestamp } || @hash[key].size
      @hash[key].insert(index, [value, -timestamp])
    end


=begin
    :type key: String
    :type timestamp: Integer
    :rtype: String
=end
    def get(key, timestamp)
      if @hash[key]
        index = @hash[key].bsearch_index { |(v1, t1)| t1 >= -timestamp } || @hash[key].size
        @hash.dig(key, index, 0) || ""
      else
        ""
      end
    end


end

# Your TimeMap object will be instantiated and called as such:
# obj = TimeMap.new()
# obj.set(key, value, timestamp)
# param_2 = obj.get(key, timestamp)
