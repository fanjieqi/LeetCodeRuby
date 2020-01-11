# @param {String[]} words
# @return {Integer[][]}
def palindrome_pairs(words)
  hash = words.map.with_index { |word, i| [word, i] }.to_h
  ans = []
  words.each_with_index do |word, i|
    if word == ""
      (0..words.length-1).each do |j|
        next if i == j
        ans << [j, i] if words[j] == words[j].reverse
      end
      next
    end
    (0..word.length-1).each do |j|
      left = word[0..j]
      left_r = left.reverse
      right = word[j+1..-1]
      right_r = right.reverse

      ans << [hash[right_r], i] if left == left_r && hash[right_r] && hash[right_r] != i
      ans << [i, hash[left_r]]  if right == right_r && hash[left_r] && hash[left_r] != i
    end
  end
  ans
end
