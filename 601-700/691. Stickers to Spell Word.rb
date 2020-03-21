def dfs(stickers, current, k)
  return @hash[current] if @hash[current]
  if @target.all? { |char, count| count <= current[char].to_i }
    @min = k if k < @min
    return 0
  end
  return k if k >= @min
  min = 1 << 31
  stickers.clone.each do |sticker|
    stickers -= [sticker] if sticker.all? { |char, count| current[char].to_i >= @target[char].to_i }
  end

  stickers.each do |sticker|
    tmp = current.clone
    sticker.each { |char, count| tmp[char] += count }
    result = 1 + dfs(stickers, tmp, k+1)
    min = result if result < min
  end
  @hash[current] = min
end

# @param {String[]} stickers
# @param {String} target
# @return {Integer}
def min_stickers(stickers, target)
  @hash = {}
  @target = target.split("").group_by(&:itself).transform_values(&:count)
  @stickers = stickers.map { |sticker| sticker.split("").select { |char| target[char] }.group_by(&:itself).transform_values(&:count) }.reject(&:empty?).uniq
  @stickers.clone.each do |smaller|
    @stickers.delete(smaller) if @stickers.any? { |bigger| bigger != smaller && smaller.all? {|c1, c2| bigger[c1].to_i >= c2 }  }
  end
  @stickers.sort_by!{|sticker| -sticker.values.sum }
  return -1 if @target.any? { |char, count| !@stickers.any? { |hash| hash[char] }  }
  @min = 1 << 31

  dfs(@stickers, @target.transform_values{0}, 0)
end
