class MyHashSet

=begin
    Initialize your data structure here.
=end
    def initialize()
      @hash = {}
    end


=begin
    :type key: Integer
    :rtype: Void
=end
    def add(key)
      @hash[key] = true
    end


=begin
    :type key: Integer
    :rtype: Void
=end
    def remove(key)
      @hash.delete(key)
    end


=begin
    Returns true if this set contains the specified element
    :type key: Integer
    :rtype: Boolean
=end
    def contains(key)
      @hash[key] || false
    end


end

# Your MyHashSet object will be instantiated and called as such:
# obj = MyHashSet.new()
# obj.add(key)
# obj.remove(key)
# param_3 = obj.contains(key)
