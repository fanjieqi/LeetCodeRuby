# @param {String} sentence
# @param {String} search_word
# @return {Integer}
def is_prefix_of_word(sentence, search_word)
  sentence.split(' ').index { |word| word.start_with?(search_word) } + 1 rescue -1
end
