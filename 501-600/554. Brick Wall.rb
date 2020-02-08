# @param {Integer[][]} wall
# @return {Integer}
def least_bricks(wall)
  return 0 if wall.length == 0 || wall[0].length == 0
  hash = {}
  total = wall.first.sum
  wall.each do |bricks|
    bricks.inject(0) do |sum, brick|
      sum += brick
      hash[sum] ||= 0
      hash[sum] += 1
      sum
    end
  end
  hash.delete(total)
  wall.length - hash.values.max.to_i
end
