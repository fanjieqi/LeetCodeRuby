# @param {String} s
# @return {String}
def reformat(s)
  chars, digits = s.scan(/[a-z]/), s.scan(/\d/)
  if (chars.size - digits.size).abs > 1
    ""
  elsif chars.size > digits.size
    chars.zip(digits).flatten.join
  else
    digits.zip(chars).flatten.join
  end
end
