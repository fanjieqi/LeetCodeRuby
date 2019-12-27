# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
  return [] if intervals.length == 0
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
