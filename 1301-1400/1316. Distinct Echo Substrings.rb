A_ORD = 'a'.ord

# @param {String} text
# @return {Integer}
def distinct_echo_substrings(text)
  hash, sum = {}, [0]
  text.chars.each_with_index do |char, i|
    hash[char] ||= []
    hash[char] << i
    sum[i+1] = sum[i] + (char.ord - A_ORD + 1)
  end

  mark = {}
  hash.each do |char, indexes|
    (0..indexes.size-2).each do |i|
      (i+1..indexes.size-1).each do |j|
        l = indexes[j] - indexes[i]
        sum1 = sum[indexes[j]] - sum[indexes[i]]
        next if indexes[i]+l > text.size
        sum2 = sum[indexes[i]+l] - sum[indexes[i]]
        next if sum1 != sum2
        s1 = text[indexes[i], l]
        next if mark[s1]
        s2 = text[indexes[j], l]
        mark[s1] = true if s1 == s2
      end
    end
  end
  mark.size
end
