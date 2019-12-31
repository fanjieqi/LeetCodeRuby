# @param {String} s
# @param {String[]} word_dict
# @return {Boolean}
def word_break(s, word_dict)
  return false if word_dict.length == 0
  f = [true]
  s = "_" + s
  (1..s.length).each do |i|
    (0..word_dict.length - 1).each do |j|
      l = word_dict[j].length
      next if i < l || s[i-l+1..i] != word_dict[j]
      f[i] ||= f[i-l]
    end
  end
  !!f[s.length-1]
end
