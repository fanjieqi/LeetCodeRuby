def get_strs(s)
  chars = []
  i = 0
  s.each_char do |c|
    if chars[-1] && c == chars[-1][-1]
      chars[-1] += c
    else
      chars << c
    end
  end
  chars
end

# @param {String} s
# @param {String[]} words
# @return {Integer}
def expressive_words(s, words)
  s_strs = get_strs(s)
  words.select do |word|
    w_strs = get_strs(word)
    s_strs.size == w_strs.size && (0..s_strs.size-1).all? { |i| s_strs[i] == w_strs[i] || s_strs[i].size > [2, w_strs[i].size].max }
  end.size
end
