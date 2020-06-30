# @param {Integer} a
# @param {Integer} b
# @return {String}
def str_without3a3b(a, b)
  str = ""
  if a > b
    str = 'ab' * b
    (1..a-b).each do 
      str[/(?<!a)a(?=b)/] ? str.sub!(/(?<!a)a(?=b)/, 'aa') : str << 'a'
    end
  elsif a < b
    str = 'ba' * a
    (1..b-a).each do
      str[/(?<!b)b(?=a)/] ? str.sub!(/(?<!b)b(?=a)/, 'bb') : str << 'b'
    end
  else
    str = 'ab' * a
  end
  str
end
