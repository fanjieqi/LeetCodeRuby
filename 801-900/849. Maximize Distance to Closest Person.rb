# @param {Integer[]} seats
# @return {Integer}
def max_dist_to_closest(seats)
  indexes = (0..seats.size-1).select { |i| seats[i] == 1 }
  max = (0..indexes.size-2).map { |i| (indexes[i+1] - indexes[i])/2 }.max
  max = indexes[0] if indexes[0] > 0 &&(max.nil? || indexes[0] > max)
  max = seats.size - indexes[-1] - 1 if indexes[-1] < seats.size-1 && (max.nil? || (seats.size - indexes[-1] -1) > max)
  max || 1
end
