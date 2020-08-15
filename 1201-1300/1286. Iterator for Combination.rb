class CombinationIterator

=begin
    :type characters: String
    :type combination_length: Integer
=end
    def initialize(characters, combination_length)
      @array = characters.chars.combination(combination_length).to_a.map(&:join)
      @k = -1
    end


=begin
    :rtype: String
=end
    def next()
      @array[@k+=1]
    end


=begin
    :rtype: Boolean
=end
    def has_next()
      !@array[@k+1].nil?
    end


end

# Your CombinationIterator object will be instantiated and called as such:
# obj = CombinationIterator.new(characters, combination_length)
# param_1 = obj.next()
# param_2 = obj.has_next()
