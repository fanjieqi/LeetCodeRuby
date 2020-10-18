# @param {String} text
# @return {String}
def reorder_spaces(text)
  spaces = text.scan(/\s+/)
  words = text.scan(/\w+/)
  n = spaces.inject(0) { |sum, s| sum + s.size }
  words.size > 1 ? (words.join(' ' * (n / (words.size-1))) + ' ' * (n % (words.size-1))) : words.first + spaces.join
end
