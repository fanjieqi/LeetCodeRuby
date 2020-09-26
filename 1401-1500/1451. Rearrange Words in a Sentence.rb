# @param {String} text
# @return {String}
def arrange_words(text)
  text.split(" ").sort_by(&:length).join(' ').downcase.capitalize
end
