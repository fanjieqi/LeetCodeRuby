class WordDictionary

  attr_accessor :childs, :isend

  def initialize()
    @childs = {}
  end

  def insert(word)
    tmp = self
    (0..word.length-1).each do |i|
      tmp.childs[word[i]] ||= WordDictionary.new
      tmp = tmp.childs[word[i]]
    end
    tmp.isend = true
  end

  def find(word)
    tmp = self
    ans = []
    (0..word.length-1).each do |i|
      tmp = tmp.childs[word[i]]
      break if tmp.nil?
      ans << i if tmp.isend
    end
    ans
  end
end

class StreamChecker

=begin
    :type words: String[]
=end
    def initialize(words)
      @dict = WordDictionary.new
      words.each do |word|
        @dict.insert(word.reverse)
      end
      @str = ''
    end


=begin
    :type letter: Character
    :rtype: Boolean
=end
    def query(letter)
      @str << letter
      i = @str.size-1
      dict = @dict
      while (dict = dict.childs[@str[i]]) && i >= 0
        return true if dict.isend
        i -= 1
      end
      false
    end


end

# Your StreamChecker object will be instantiated and called as such:
# obj = StreamChecker.new(words)
# param_1 = obj.query(letter)
