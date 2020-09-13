# @param {String[]} words
# @return {String[]}
def string_matching(words)
  words.select { |word| words.any? { |tmp| tmp.size > word.size && tmp[word] } }
end
