# @param {Integer[][]} intervals
# @return {Integer}
def remove_covered_intervals(intervals)
  intervals.sort!
  i = 0
  while i < intervals.size-1
    if intervals[i][0] <= intervals[i+1][0] && intervals[i][1] >= intervals[i+1][1]
      intervals.delete_at(i+1)
    elsif intervals[i][0] == intervals[i+1][0] && intervals[i][1] <= intervals[i+1][1]
      intervals.delete_at(i)
    else
      i += 1
    end
  end
  intervals.size
end
