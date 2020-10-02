# @param {String} s
# @return {String[]}
def max_num_of_substrings(s)
  fst = ('a'..'z').map { |char| [char, s.index(char)] }.to_h
  lst = ('a'..'z').map { |char| [char, s.rindex(char)] }.to_h
  
  ans, prev = [], -1
  lst.values.compact.sort.each do |i|
    b, e = fst[s[i]], lst[s[i]]
    j = e
    while j >= b && b > prev && e == i
      b = fst[s[j]] if fst[s[j]] < b
      e = lst[s[j]] if lst[s[j]] > e
      j -= 1
    end
    if b > prev && e == i
      ans.append(s[b..e])
      prev = e
    end
  end

  ans
end
