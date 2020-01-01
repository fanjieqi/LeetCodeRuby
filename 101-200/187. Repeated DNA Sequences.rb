# @param {String} s
# @return {String[]}
def find_repeated_dna_sequences(s)
  return [] if s.length < 10
  ans = {}
  (0..s.length-10).each do |i|
    ans[s[i,10]] ||= 0
    ans[s[i,10]] += 1
  end
  ans.select{|k,v| v > 1}.keys
end
