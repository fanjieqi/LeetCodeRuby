# @param {String} s
# @param {String[]} words
# @return {Integer}
def num_matching_subseq(s, words)
  hash = {}
  s.each_char.with_index { |c, i| hash[c] ||= i }

  sum = 0
  words.sort.each do |word|
    k = (word.size-1).downto(0).find { |i| hash[word[0..i]] }
    next if k.nil?
    from = hash[word[0..k]]
    flag = true
    (k+1..word.size-1).each do |i|
      from = s.index(word[i], from+1)
      if from.nil?
        flag = false
        break
      else
        hash[word[0..i]] = from
      end
    end
    sum += 1 if flag
  end
  sum
end
