def length(p1, p2)
  ((p2[0] - p1[0])**2) + ((p2[1] -p1[1])**2)
end

# @param {Integer[]} p1
# @param {Integer[]} p2
# @param {Integer[]} p3
# @param {Integer[]} p4
# @return {Boolean}
def valid_square(p1, p2, p3, p4)
  points = [p1, p2, p3, p4]
  points.uniq.size == 4 && points.map { |pa| points.map {|pb| length(pa, pb)}}.flatten.uniq.size == 3
end
