# @param {String} s
# @return {Integer}
def unique_letter_string(s)
  hash = ('A'..'Z').map { |c| [c, [-1, -1]] }.to_h
  sum = 0
  s.each_char.with_index do |c, i|
    k, j = hash[c]
    sum += (i - j) * (j - k)
    hash[c] = [j, i]
  end
  hash.each do |c, (k, j)|
    sum += (s.length - j) * (j - k)
  end
  sum % (10**9 + 7)
end
