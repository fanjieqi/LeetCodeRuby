class Trie

    attr_accessor :childs, :isend

=begin
    Initialize your data structure here.
=end
    def initialize()
      @childs = {}
    end


=begin
    Inserts a word into the trie.
    :type word: String
    :rtype: Void
=end
    def insert(word)
      tmp = self
      word.split("").each do |char|
        tmp.childs[char] ||= Trie.new
        tmp = tmp.childs[char]
      end
      tmp.isend = true
      nil
    end

    def find(word)
      tmp = self
      word.split("").each do |char|
        tmp = tmp.childs[char]
        return false if tmp.nil?
      end
      tmp
    end


=begin
    Returns if the word is in the trie.
    :type word: String
    :rtype: Boolean
=end
    def search(word)
      result = find(word)
      !!(result && result.isend)
    end


=begin
    Returns if there is any word in the trie that starts with the given prefix.
    :type prefix: String
    :rtype: Boolean
=end
    def starts_with(prefix)
      !!find(prefix)
    end


end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)
