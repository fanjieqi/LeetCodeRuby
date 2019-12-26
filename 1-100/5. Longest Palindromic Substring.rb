# @param {String} s
# @return {String}
def longest_palindrome(s)
  return s if s.size() <= 2
  min_start = 0
  max_len = 1;
  (0..s.length-1).each do |i|
    break if (s.size() - i <= max_len / 2)
    j = i
    k = i
    k+=1 while (k < s.size()-1 && s[k+1] == s[k])
    i = k+1;
    
    while (k < s.size()-1 && j > 0 && s[k + 1] == s[j - 1])
      k += 1
      j -= 1
    end
    new_len = k - j + 1;
    if (new_len > max_len)
      min_start = j
      max_len = new_len
    end
  end
  s[min_start, max_len]
end
