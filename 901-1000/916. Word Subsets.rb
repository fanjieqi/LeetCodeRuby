# @param {String[]} a
# @param {String[]} b
# @return {String[]}
def word_subsets(a, b)
  hash = {}
  b.each do |word|
    word.split("").group_by(&:itself).transform_values(&:count).each do |char, count|
      hash[char] = count if hash[char].nil? || count > hash[char]
    end
  end
  a.select do |word|
    tmp = word.split("").group_by(&:itself).transform_values(&:count)
    hash.all? { |char, count| count <= tmp[char].to_i }
  end
end
