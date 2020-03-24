# @param {String[]} words
# @return {String}
def longest_word(words)
  words = words.sort_by!(&:length).reverse
  hash = words.map { |word| [word, true] }.to_h
  ans = ""
  words.each do |word|
    next if word.size < ans.size
    i = word.size-1
    i -= 1 while i > 0 && hash[word[0..i]]
    ans = word if i == 0 && hash[word[0]] && (word.size > ans.size || word.size == ans.size && word < ans)
  end
  ans
end
