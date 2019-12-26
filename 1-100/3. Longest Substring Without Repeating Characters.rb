# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  return 0 if s.empty?
  length  = 1
  maxstr  = s[0]
  left  = 0
  right = 1

  while left < s.length && right < s.length
    tmp = s[left..right-1].index(s[right])
    if tmp
      left += tmp + 1
      right = [left+1, right].max
    elsif (right - left + 1) > length
      maxstr = s[left..right]
      length = (right - left + 1)
      right +=1
    else
      right += 1
    end
  end
  length
end
