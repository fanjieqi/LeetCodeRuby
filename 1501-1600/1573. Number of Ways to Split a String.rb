MOD = 10**9 + 7
# @param {String} s
# @return {Integer}
def num_ways(s)
  indexes = (0..s.size-1).select { |i| s[i] == '1' }
  return 0 if indexes.count % 3 == 1 || indexes.count % 3 == 2
  return (1..s.size-1).to_a.combination(2).size % MOD if indexes.count == 0
  i = indexes.size / 3
  (indexes[i] - indexes[i-1]) * (indexes[i*2] - indexes[i*2-1]) % MOD
end
