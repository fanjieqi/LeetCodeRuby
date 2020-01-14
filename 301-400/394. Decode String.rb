# @param {String} s
# @return {String}
def decode_string(s)
  while s[/\[/]
    tmp = s[/\d+\[[a-zA-Z]+\]/]
    n, ele = tmp.split(/[\[\]]/)
    s.gsub!(tmp, ele * n.to_i)
  end
  s
end
