# @param {String} pattern
# @param {String} str
# @return {Boolean}
def word_pattern(pattern, str)
  h1 = {}
  h2 = {}
  patterns = pattern.split("")
  words = str.split(" ")
  return false if patterns.length != words.length
  (0..words.length-1).each do |i|
    if h1[words[i]].nil? && h2[patterns[i]].nil?
      h1[words[i]] = patterns[i]
      h2[patterns[i]] = words[i]
    elsif h1[words[i]] != patterns[i] || h2[patterns[i]] != words[i]
      return false
    end
  end
  true
end
