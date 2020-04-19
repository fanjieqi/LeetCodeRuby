# @param {String[]} words
# @return {Integer}
def minimum_length_encoding(words)
  words = words.map(&:reverse).sort
  i, sum = 0, 0
  while i < words.size
    i += 1 while words[i+1].to_s.start_with?(words[i])
    sum += words[i].size + 1
    i += 1
  end
  sum
end
