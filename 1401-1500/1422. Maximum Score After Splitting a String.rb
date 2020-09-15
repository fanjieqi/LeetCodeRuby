# @param {String} s
# @return {Integer}
def max_score(s)
  count0, count1 = 0, s.scan('1').size
  max = 0
  (0..s.size-2).each do |i|
    if s[i] == '0'
      count0 += 1
    else
      count1 -= 1
    end
    tmp = count0 + count1
    max = tmp if tmp > max
  end
  max
end
