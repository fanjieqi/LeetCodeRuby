class WordDictionary

  attr_accessor :childs, :isend

  def initialize()
    @childs = {}
  end

  def insert(word)
    return @isend = true if word.length == 0
    @childs[word[0]] ||= WordDictionary.new
    @childs[word[0]].insert(word[1..-1])
    nil
  end

  def find_exclude(word)
    return "" if @isend && @childs.empty?
    result = @childs.map { |char, node|
      if word[char]
        nil
      else
        tmp = node.find_exclude(word)
        tmp.nil? ? nil : char + tmp
      end
    }
    result.reject(&:nil?).sort_by(&:length).last
  end
end

# @param {String[]} words
# @return {Integer}
def max_product(words)
  dict = WordDictionary.new
  words.each do |word|
    dict.insert(word) if word.length > 0
  end
  words.map{ |word|
    word.length * dict.find_exclude(word).to_s.length
  }.max || 0
end
