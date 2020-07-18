# @param {String[]} words
# @return {Integer}
def longest_str_chain(words)
  hash = words.group_by(&:size)
  max, length = 1, {}
  hash.sort[0..-2].each do |len, values|
    values.each do |w1|
      length[w1] ||= 1
      hash[len+1].each do |w2|
        tmp = length[w1] + 1
        next if length[w2] && length[w2] > tmp
        l = (0..len-1).find { |i| w1[i] != w2[i] }
        next if l && (l..len-1).find { |i| w1[i] != w2[i+1] }

        length[w2] = tmp
        max = tmp if tmp > max
      end
    end
  end
  max
end
