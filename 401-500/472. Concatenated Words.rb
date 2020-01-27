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

# @param {String[]} words
# @return {String[]}
def find_all_concatenated_words_in_a_dict(words)
  words = words.sort_by(&:length)
  dict = WordDictionary.new

  ans = []
  words.each do |word|
    next if word.length == 0
    queue = Queue.new
    queue << word
    while !queue.empty?
      tmp = queue.pop
      arr = dict.find(tmp).sort.reverse
      arr.each do |i|
        if i == tmp.length - 1
          ans << word
          break
        else
          queue << tmp[i+1..-1]
        end
      end
    end
    dict.insert(word) if ans.last != word
  end
  ans.uniq
end
