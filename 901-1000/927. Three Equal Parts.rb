# @param {Integer[]} a
# @return {Integer[]}
def three_equal_parts(a)
  return [0, a.size-1] if a.all?(&:zero?)
  s = a.join
  tmp = s.match(/^0*(1.*)0*(\1)0*(\1)$/)[1]
  i = s.index(tmp) + tmp.size - 1
  j = s.index(tmp, i+1) + tmp.size
  [ i , j ]
rescue => e
  [-1, -1]
end
