class MagicDictionary

=begin
    Initialize your data structure here.
=end
    def initialize()
      @array = [{}]
    end


=begin
    Build a dictionary through a list of words
    :type dict: String[]
    :rtype: Void
=end
    def build_dict(dict)
      dict.each do |word|
        (0..word.size-1).each do |i|
          rest = (i==0) ? word[1..-1] : (i==word.size-1) ? word[0..-2] : word[0..i-1] + word[i+1..-1]
          @array[i] ||= {}
          @array[i][rest] ||= []
          @array[i][rest] << word
        end
      end
      @array
    end


=begin
    Returns if there is any word in the trie that equals to the given word after modifying exactly one character
    :type word: String
    :rtype: Boolean
=end
    def search(word)
      (0..word.size-1).any? do |i|
        rest = (i==0) ? word[1..-1] : (i==word.size-1) ? word[0..-2] : word[0..i-1] + word[i+1..-1]
        @array[i] && @array[i][rest] && (@array[i][rest] - [word]).size >= 1
      end
    end


end

# Your MagicDictionary object will be instantiated and called as such:
# obj = MagicDictionary.new()
# obj.build_dict(dict)
# param_2 = obj.search(word)
