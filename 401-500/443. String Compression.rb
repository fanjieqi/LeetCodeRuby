# @param {Character[]} chars
# @return {Integer}
def compress(chars)
  s = ""
  l = 0
  r = 0
  while r <= chars.length-1
    r = l + 1
    r += 1 while (r<=chars.length-1) && chars[r] == chars[l]
    s += chars[l]
    s += (r-l).to_s if (r-l) > 1
    l = r
  end
  s.split("").each_with_index{|c, i| chars[i] = c}
  s.length
end
