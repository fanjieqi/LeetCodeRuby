# @param {Integer[]} asteroids
# @return {Integer[]}
def asteroid_collision(asteroids)
  array = []
  asteroids.each do |asteroid|
    if array.empty? || asteroid.positive?
      array << asteroid
    elsif asteroid.negative?
      array.pop while !array.empty? && array.last > 0 && array.last < asteroid.abs
      next if !array.empty? && array.last > 0 && array.last > asteroid.abs
      if !array.empty? && array.last > 0 && array.last == asteroid.abs
        array.pop
      else
        array << asteroid
      end
    end
  end
  array
end
