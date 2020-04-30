# @param {Integer} target
# @param {Integer[]} position
# @param {Integer[]} speed
# @return {Integer}
def car_fleet(target, position, speed)
  array = position.zip(speed).sort_by(&:first).reverse
  stack = []
  array.each do |pos, v|
    t = (target - pos)/v.to_f
    stack << t if stack.empty? || t > stack.last
  end
  stack.size
end
