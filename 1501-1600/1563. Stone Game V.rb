def dfs(l, r)
  return @hash[l][r] if @hash.dig(l, r)
  return @stones[l..r].min if l + 1 == r
  return @uniq[r-l+1][@is_uniq[l][r]] if @is_uniq.dig(l, r) && @uniq.dig(r-l+1, @is_uniq[l][r])
  return 0 if l == r
  max = 0
  (l..r-1).each do |mid|
    lsum = @sum[mid+1] - @sum[l]
    rsum = @sum[r+1] - @sum[mid+1]
    if lsum >= rsum
      tmp = rsum + dfs(mid + 1, r)
      max = tmp if tmp > max
    end
    if lsum <= rsum
      tmp = lsum + dfs(l, mid)
      max = tmp if tmp > max
    end
  end
  @hash[l] ||= {}
  @hash[l][r] = max
  if @is_uniq[l][r]
    @uniq[r-l+1] ||= {}
    @uniq[r-l+1][@is_uniq[l][r]] = max
  end
  @hash[l][r]
end

# @param {Integer[]} stone_value
# @return {Integer}
def stone_game_v(stone_value)
  @stones, @sum, @hash, @uniq = stone_value, [0], [], {}
  stone_value.each_with_index { |value, i| @sum[i+1] = @sum[i] + value }
  @is_uniq = []
  (0..@stones.size-2).each do |l|
    @is_uniq[l] = []
    @is_uniq[l][l] = @stones[l]
    (l+1..@stones.size-1).each do |r|
      @is_uniq[l][r] = @stones[r] == @stones[r-1] && @is_uniq[l][r-1]
    end
  end
  dfs(0, stone_value.size-1)
end
