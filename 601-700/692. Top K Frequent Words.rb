# @param {String[]} words
# @param {Integer} k
# @return {String[]}
def top_k_frequent(words, k)
  words.group_by(&:itself).transform_values(&:count).sort_by { |char, count| [-count, char] }.map(&:first)[0,k]
end
