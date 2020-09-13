# @param {Integer} a
# @param {Integer} b
# @param {Integer} c
# @return {String}
def longest_diverse_string(a, b, c)
  hash = { 'a' => a, 'b' => b, 'c' => c }
  array = [%w(a b c), %w(b a c), %w(c a b)]#.sort_by { |arr| -hash[arr[0]] }
  str = ""
  (a + b + c).times do
    array.each do |cur, t1, t2|
      next if hash[cur] == 0
      if (hash[cur] >= hash[t1] && hash[cur] >= hash[t2] && str[-2..-1] != cur * 2) || (str[-2..-1] == t1 * 2 || str[-2..-1] == t2 * 2)
        str << cur
        hash[cur] -= 1
      end
    end
  end
  str
end
