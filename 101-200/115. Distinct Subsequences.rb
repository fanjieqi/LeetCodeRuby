# @param {String} s
# @param {String} t
# @return {Integer}
def num_distinct(s, t)
  return 0 if s.length == 0 || t.length == 0
  index = s.index(t[0])
  return 0 if index.nil?
  s = s[index..-1]
  return 0 if s.length < t.length

  f = []
  (0..s.length-1).each do |i|
    f[i] ||= []
    (0..t.length-1).each do |j|
      f[i][j] ||= 0
      next if  i < j || s[i] != t[j]
      f[i][j] = i == 0 || j == 0 ? 1 : f[j-1..i-1].map{ |ele| ele[j-1] }.sum
    end
  end
  f[t.length-1..s.length-1].map { |ele| ele[t.length-1] }.sum
end
