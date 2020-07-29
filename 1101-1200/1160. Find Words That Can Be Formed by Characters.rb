# @param {String[]} words
# @param {String} chars
# @return {Integer}
def count_characters(words, chars)
  @hash = chars.chars.group_by(&:itself).transform_values(&:count)
  words.inject(0) do |sum, word|
    tmp = word.chars.group_by(&:itself).transform_values(&:count)
    sum += tmp.all? { |char, count| count <= @hash[char].to_i } ? word.size : 0
  end
end
