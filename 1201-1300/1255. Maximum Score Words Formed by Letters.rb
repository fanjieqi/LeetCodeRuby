def dfs(i)
  @ans = @current if @current > @ans
  return if i >= @words.size
  (i..@words.size-1).each do |j|
    @words[j].each { |char, count| @letters[char] = @letters[char].to_i - count; @current += @score[char] * count }
    dfs(j+1) if @letters.all? { |letter, count| count >= 0 }
    @words[j].each { |char, count| @letters[char] = @letters[char].to_i + count; @current -= @score[char] * count }
    dfs(j+1)
  end
end

# @param {String[]} words
# @param {Character[]} letters
# @param {Integer[]} score
# @return {Integer}
def max_score_words(words, letters, score)
  @letters = letters.group_by(&:itself).transform_values(&:count)
  @words = words.map { |word| word.chars.group_by(&:itself).transform_values(&:count) }
  @score = score.map.with_index { |num, i| [('a'.ord + i).chr, num] }.to_h
  @ans, @current = 0, 0
  dfs(0)
  @ans
end
