# @param {Integer} a
# @param {Integer[]} b
# @return {Integer}
def super_pow(a, b)
  hash = {}
  result = []
  tmp = 1
  loop do
    tmp = (tmp * a) % 1337
    break if hash[tmp]
    hash[tmp] = true
    result << tmp
  end
  result[(b.join.to_i-1) % result.length]
end
