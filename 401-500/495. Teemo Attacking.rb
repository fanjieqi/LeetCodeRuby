# @param {Integer[]} time_series
# @param {Integer} duration
# @return {Integer}
def find_poisoned_duration(time_series, duration)
  return 0 if time_series.length == 0
  max = 0
  ans = 0
  k = nil
  time_series.each_with_index do |time, i|
    # p [max, time, max < time] 
    if k.nil?
      k = i
    elsif max < time
      ans += max - time_series[k]
      k = i
    end
    max = time + duration
  end
  ans + max - time_series[k]
end
