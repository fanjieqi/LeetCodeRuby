def dfs(str, index, hash)
  return if @min && str > @min || (str.size-index-1) > @hash.size || hash.size > 0 && index > hash.values.map(&:last).min
  return @min = str if str.size == @size

  hash.keys.sort.each do |char|
    indexes = hash[char]
    i = indexes.bsearch_index { |j| j >= index }
    next if i.nil?
    hash.delete(char)
    dfs(str + char, indexes[i], hash)
    hash[char] = indexes
  end
end

@count = 0

# @param {String} text
# @return {String}
def smallest_subsequence(text)
  @hash = {}
  text.chars.each_with_index { |char, i| @hash[char] = @hash[char].to_a + [i] }
  @size = @hash.size
  @min = nil
  dfs("", -1, @hash)
  @min
end
