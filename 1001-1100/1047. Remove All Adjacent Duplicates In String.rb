# @param {String} s
# @return {String}
def remove_duplicates(s)
  i = 0
  s = s.chars
  while i < s.size-1
    if s[i] == s[i+1]
      s.delete_at(i)
      s.delete_at(i)
      i -= 1 if i > 0
    else
      i += 1
    end
  end
  s.join
end
