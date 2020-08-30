VOWELS = %w(a e i o u)

# @param {String} s
# @return {Integer}
def find_the_longest_substring(s)
  sum = [{'a' => 0, 'e' => 0, 'i' => 0, 'o' => 0, 'u' => 0}]
  s.each_char.with_index do |char, i|
    sum[i+1] = sum[i].clone
    sum[i+1][char] += 1 if VOWELS.include?(char)
  end
  n = s.size
  l, r = 0, 2*n
  while l < r
    mid = (l + r) / 2
    if (0..n-mid).any? { |i| VOWELS.all? { |vowel| (sum[i+mid][vowel] - sum[i][vowel]).even? } }
      l = mid+1
    else
      r = mid
    end
  end

  ans = l - 1

  (l..n).each do |j|
    ans = j if (0..n-j).any? { |i| VOWELS.all? { |vowel| (sum[i+j][vowel] - sum[i][vowel]).even? } }
  end
  ans
end
