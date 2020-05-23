# @param {String[]} words
# @param {String} pattern
# @return {String[]}
def find_and_replace_pattern(words, pattern)
  words.select do |word|
    hash1, hash2 = {}, {}
    word.each_char.with_index.all? do |char, i|
      if hash1[pattern[i]].nil? && hash2[char].nil?
        hash1[pattern[i]] = char
        hash2[char] = pattern[i]
      else
        hash1[pattern[i]] == char && hash2[char] == pattern[i]
      end
    end
  end
end
