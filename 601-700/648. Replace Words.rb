# @param {String[]} dict
# @param {String} sentence
# @return {String}
def replace_words(dict, sentence)
  sentence.split(" ").map{|tmp| dict.find{|dic| tmp.start_with?(dic) } || tmp }.join(" ")
end
