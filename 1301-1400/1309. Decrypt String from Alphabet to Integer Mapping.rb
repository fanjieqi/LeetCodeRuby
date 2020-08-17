# @param {String} s
# @return {String}
def freq_alphabets(s)
  while tmp = s[/\d{2}\#/]
    s.gsub!(tmp, ('a'.ord + tmp.to_i-1).chr)
  end
  s.split('').map { |char| char[/\d/] ? ('a'.ord + char.to_i-1).chr : char }.join
end
