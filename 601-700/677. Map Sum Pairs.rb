class MapSum

=begin
    Initialize your data structure here.
=end
    def initialize()
      @hash = {}
    end


=begin
    :type key: String
    :type val: Integer
    :rtype: Void
=end
    def insert(key, val)
      (0..key.size-1).each do |i|
        @hash[key[0..i]] ||= {}
        @hash[key[0..i]][key] = val
      end
    end


=begin
    :type prefix: String
    :rtype: Integer
=end
    def sum(prefix)
      @hash[prefix] ? @hash[prefix].values.sum : 0
    end


end

# Your MapSum object will be instantiated and called as such:
# obj = MapSum.new()
# obj.insert(key, val)
# param_2 = obj.sum(prefix)
