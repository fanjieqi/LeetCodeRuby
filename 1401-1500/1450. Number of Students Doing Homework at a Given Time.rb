# @param {Integer[]} start_time
# @param {Integer[]} end_time
# @param {Integer} query_time
# @return {Integer}
def busy_student(start_time, end_time, query_time)
  (0..start_time.size-1).inject(0) { |sum, i| sum + (start_time[i]<=query_time && query_time <= end_time[i] ? 1 :0) }
end
