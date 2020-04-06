def dfs(cur, i)
  if i == @s.size
    @hash[cur] ||= true
  elsif @s[i][/\d/]
    dfs(cur+@s[i], i+1)
  else
    dfs(cur+@s[i].downcase, i+1)
    dfs(cur+@s[i].upcase, i+1)
  end
end

# @param {String} s
# @return {String[]}
def letter_case_permutation(s)
  @hash, @s = {}, s
  dfs("", 0)
  @hash.keys
end
