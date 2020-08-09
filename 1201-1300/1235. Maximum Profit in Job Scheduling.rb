# @param {Integer[]} start_time
# @param {Integer[]} end_time
# @param {Integer[]} profit
# @return {Integer}
def job_scheduling(start_time, end_time, profit)
  n = start_time.size
  schedules = (0..n-1).map { |i| [start_time[i], end_time[i], profit[i]] }.sort_by { |schedule| schedule[1] }
  f = [[0, 0]]
  schedules.each do |s, t, profit1|
    i = f.bsearch_index { |ele| ele[0] >= s+1 }.to_i - 1
    tmp = f[i][1] + profit1
    f << [t, tmp] if tmp > f[-1][1]
  end
  f[-1][1]
end
