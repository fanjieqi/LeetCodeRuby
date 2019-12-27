def justify(str, max_width)
  count = str.split(" ").count - 1
  return left_justify(str, max_width) if count == 0
  tmp = max_width - str.length
  i = tmp / count
  j = tmp % count
  ele = " " * (i + 1)
  str.gsub!(" ", ele)
  j.times do
    str.sub!(/(?<!\s)#{ele}(?![\s])/, ele + " ")
  end
  str
end

def left_justify(str, max_width)
  count = str.split(" ").count - 1
  str + " " * (max_width - str.length)
end

# @param {String[]} words
# @param {Integer} max_width
# @return {String[]}
def full_justify(words, max_width)
  ans = [words.first]
  words[1..-1].each do |word|
    if (ans[-1].length + word.length + 1) <= max_width
      ans[-1] += " " + word
    else
      ans[-1] = justify(ans[-1], max_width)
      ans << word
    end
  end
  ans[-1] = left_justify(ans[-1], max_width)
  ans
end

# p full_justify(["This", "is", "an", "example", "of", "text", "justification."], 16)
# p full_justify(["What","must","be","acknowledgment","shall","be"], 16)
# p full_justify(["Science","is","what","we","understand","well","enough","to","explain", "to","a","computer.","Art","is","everything","else","we","do"], 20)