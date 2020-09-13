# @param {Integer[]} satisfaction
# @return {Integer}
def max_satisfaction(satisfaction)
  satisfaction.sort!
  n, cur, sum = satisfaction.size, 0, [0]
  satisfaction.each_with_index do |num, i|
    sum[i+1] = sum[i] + num
    cur += num * (i+1)
  end
  i = 0
  while (tmp = cur - (sum[n] - sum[i])) >= cur
    return 0 if n == i
    i += 1
    cur = tmp
  end
  cur
end
