# @param {Integer} n
# @param {String[]} logs
# @return {Integer[]}
def exclusive_time(n, logs)
  logs = logs.map { |log| log=log.split(":"); [log[0].to_i, log[1], log[2].to_i] }.sort_by(&:last)

  stack = []
  count = n.times.map{0}

  logs.each do |id, mark, time_at|
    if mark == "start"
      if stack.last
        cur_id, cur_at = stack.last
        count[cur_id] += time_at - cur_at
      end
      stack << [id, time_at]
    else
      cur_id, cur_at = stack.pop
      count[cur_id] += time_at - cur_at + 1
      stack.last[1] = time_at + 1 if stack.last
    end
  end
  count
end
