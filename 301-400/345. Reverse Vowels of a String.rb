# @param {String} s
# @return {String}
def reverse_vowels(s)
  vowels = s.scan(/[aeiouAEIOU]/)
  (0..s.length-1).each do |i|
    s[i] = vowels.pop if s[i][/[aeiouAEIOU]/]
  end
  s
end
