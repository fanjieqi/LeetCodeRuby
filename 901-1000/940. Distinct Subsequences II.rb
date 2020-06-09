MOD = 10**9 + 7
# @param {String} s
# @return {Integer}
def distinct_subseq_ii(s)
  array = [0] * 26
  s.each_char do |c|
    array[c.ord - 'a'.ord] = array.sum + 1
  end
  array.sum % MOD
end
