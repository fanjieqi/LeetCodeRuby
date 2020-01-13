# @param {String} s
# @param {String} t
# @return {Boolean}
def is_subsequence(s, t)
  i = 0
  s.split("").each do |c|
    ii = t[i..-1].index(c)
    return false if ii.nil?
    i += ii+1
  end
  true
end
