# @param {Integer[][]} intervals
# @param {Integer[]} new_interval
# @return {Integer[][]}
def insert(intervals, new_interval)
  return [] if intervals.length == 0 && new_interval.length == 0
  return intervals if new_interval.length == 0
  intervals << new_interval
  intervals = intervals.sort
  ans = [intervals[0]]
  (1..intervals.length-1).each do |i|
    if ans[-1][1] < intervals[i][0]
      ans << intervals[i]
    elsif ans[-1][1] < intervals[i][1]
      ans[-1][1] = intervals[i][1]
    end
  end
  ans
end
