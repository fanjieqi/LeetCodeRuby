REST_CHARS = {
  'a' => %w(b c),
  'b' => %w(a c),
  'c' => %w(a b),
}
# @param {String} s
# @return {Integer}
def number_of_substrings(s)
  n, count = s.size, 0
  s.each_char.with_index do |char, i|
    c1, c2 = REST_CHARS[char]
    j = s.index(c1, i+1)
    next if j.nil?
    k = s.index(c2, i+1)
    next if k.nil?
    count += j > k ? (n - j) : (n - k)
  end
  count
end
