# @param {String} s
# @return {String}
def make_largest_special(s)
  count = i = 0
  res = []
  s.split("").each_with_index do |v, j|
    count += (v=='1' ? 1 : -1)
    next if count != 0
    res << ('1' + make_largest_special(s[i+1..j]) + '0')
    i = j + 1
  end
  res.sort.reverse.join
end
