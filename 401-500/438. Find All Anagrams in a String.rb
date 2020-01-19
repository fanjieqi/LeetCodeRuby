# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, t)
  h1 = t.split("").group_by(&:itself).transform_values(&:count)

  ans = []
  hash = {}
  (0..s.length-t.length).each do |i|
    if i == 0
      hash = s[0..t.length-1].split("").group_by(&:itself).transform_values(&:count)
    else
      hash[s[i-1]] == 1 ? hash.delete(s[i-1]) : hash[s[i-1]] -= 1
      hash[s[i+t.length-1]] ||= 0
      hash[s[i+t.length-1]] += 1
    end
    ans << i if hash == h1
  end
  ans
end
