def check(s1, s2)
  tmp = -1
  s1.split("").each do |char|
    s2 = s2[tmp+1..-1]
    tmp = s2.index(char)
    return false if tmp.nil?
  end
  true
end

# @param {String} s
# @param {String[]} d
# @return {String}
def find_longest_word(s, d)
  d.sort_by {|str| [-str.length, str] }.find { |str| check(str, s)}.to_s
end
