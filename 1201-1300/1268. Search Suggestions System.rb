class WordDictionary

  attr_accessor :childs, :isend, :array

  def initialize()
    @childs, @isend, @array = {}, false, []
  end

  def insert(word)
    iterator = self
    (0..word.size-1).each do |i|
      iterator.childs[word[i]] ||= WordDictionary.new
      iterator = iterator.childs[word[i]]
      iterator.array << word
      iterator.array = iterator.array.sort[0..2]
    end
    iterator.isend = true
  end

end

# @param {String[]} products
# @param {String} search_word
# @return {String[][]}
def suggested_products(products, search_word)
  dict = WordDictionary.new
  products.each { |product| dict.insert(product) }
  search_word.chars.map do |char|
    dict = dict ? dict.childs[char] : nil
    dict&.array || []
  end
end
