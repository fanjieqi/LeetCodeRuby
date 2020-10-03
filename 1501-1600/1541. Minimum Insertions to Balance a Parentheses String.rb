# @param {String} s
# @return {Integer}
def min_insertions(s)
  s.gsub!('))','_')
  left, right = 0, s.scan(')').count
  s.each_char do |char|
    if char == '('
      left += 1
    elsif left > 0
      left -= 1
    else
      right += 1
    end
  end
  left * 2 + right
end
