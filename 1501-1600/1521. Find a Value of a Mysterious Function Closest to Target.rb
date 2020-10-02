def dfs(arr)
  return if arr.empty?
  tmp = arr.map { |num| (num - @target).abs }.min
  return if @min && tmp >= @min
  @min = tmp
  arr = (0..arr.size-2).map { |i| arr[i] & arr[i+1] }
  indexes = (0..arr.size-1).select { |i| arr[i] == 0 }
  return if arr.empty?
  indexes.unshift(-1)
  indexes.append(arr.size)
  (0..indexes.size-2).each_with_index do |i, j|
    dfs(arr[indexes[i]+1..indexes[i+1]-1])
  end
end

# @param {Integer[]} arr
# @param {Integer} target
# @return {Integer}
def closest_to_target(arr, target)
  @min, @target = nil, target
  dfs(arr)
  @min
end
