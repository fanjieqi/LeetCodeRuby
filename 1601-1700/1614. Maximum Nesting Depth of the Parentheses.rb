# @param {String} s
# @return {Integer}
def max_depth(s)
  stack, max = 0, 0
  s.each_char do |char|
    case char
    when '(' then 
      stack += 1
      max = stack if stack > max
    when ')' then stack -= 1
    end
  end
  max
end
