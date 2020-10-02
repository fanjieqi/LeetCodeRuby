MOD = 10**9 + 7
# @param {String} s
# @return {Integer}
def num_sub(s)
  count = 0
  s.scan(/[1]+/).each do |str|
    count += str.size + str.size * (str.size-1) / 2
  end
  count % MOD
end
