def dfs(i, j, carry)
  return if @ans
  return @ans |= (j == 0 && carry == 0) if @result[i].nil?

  if @words[j].nil?
    sum = carry + @words.inject(0) { |sum, word| sum += word[i] ? @hash[word[i]].keys[0] : 0 }
    num = sum % 10
    carry = sum / 10
    return if @hash[@result[i]] && @hash[@result[i]][num].to_i.zero?
    return if num == 0 && @forbiden[@result[i]]
    return if @hash[@result[i]].nil? && @rest[num].nil?
    @rest.delete(num)
    @hash[@result[i]] ||= {}
    @hash[@result[i]][num] = @hash[@result[i]][num].to_i + 1
    dfs(i+1, 0, carry)
    return if @ans
    @hash[@result[i]][num] -= 1
    if @hash[@result[i]][num].zero?
      @hash.delete(@result[i])
      @rest[num] = num
    end
    return
  elsif @words[j][i].nil? || @hash[@words[j][i]]
    return dfs(i, j+1, carry)
  end

  @rest.keys.each do |num|
    next if @rest[num].nil? || num == 0 && @forbiden[@words[j][i]]
    @rest.delete(num)
    @hash[@words[j][i]] ||= {}
    @hash[@words[j][i]][num] = @hash[@words[j][i]][num].to_i + 1
    dfs(i, j+1, carry)
    return if @ans
    @hash[@words[j][i]][num] -= 1
    if @hash[@words[j][i]][num].zero?
      @hash.delete(@words[j][i])
      @rest[num] = num
    end
  end
end

# @param {String[]} words
# @param {String} result
# @return {Boolean}
def is_solvable(words, result)
  @words, @result = words.map(&:reverse).sort_by(&:length), result.reverse
  @chars = (result + words.join).chars.uniq

  @rest = (0..9).map { |i| [i, i] }.to_h
  @hash, @forbiden, @ans = {}, {}, false
  @forbiden[@result[-1]] = true
  @words.each { |word| @forbiden[word[-1]] = true }

  dfs(0, 0, 0)
  @ans
end
