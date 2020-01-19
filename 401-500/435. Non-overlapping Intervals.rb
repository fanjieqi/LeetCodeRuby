def erase_overlap_intervals1(intervals)
  min = -(1 << 31)
  intervals.sort_by(&:last).reject { |i, j|
    min = j if i >= min
  }.size
end
