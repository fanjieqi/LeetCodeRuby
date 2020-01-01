class WordDictionary

  attr_accessor :childs, :isend

=begin
    Initialize your data structure here.
=end
    def initialize()
      @childs = {}
    end


=begin
    Adds a word into the data structure.
    :type word: String
    :rtype: Void
=end
    def add_word(word)
      if word.length == 0
        @isend = true
      else
        @childs[word[0]] ||= WordDictionary.new
        @childs[word[0]].add_word(word[1..-1])
      end
      nil
    end

=begin
    Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter.
    :type word: String
    :rtype: Boolean
=end
    def search(word)
      return true if @isend && word.length == 0
      if word[0] == "."
        @childs.any? { |key, child| child.search(word[1..-1]) }
      elsif @childs[word[0]]
        @childs[word[0]].search(word[1..-1])
      else
        false
      end
    end


end

# Your WordDictionary object will be instantiated and called as such:
# obj = WordDictionary.new()
# obj.add_word(word)
# param_2 = obj.search(word)
