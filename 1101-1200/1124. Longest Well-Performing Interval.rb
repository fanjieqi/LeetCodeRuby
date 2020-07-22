# @param {Integer[]} hours
# @return {Integer}
def longest_wpi(hours)
  ans, count = 0, 0
  seen = {}
  hours.each_with_index do |hour, i|
    count = count + (hour > 8 ? 1 : -1)
    ans = i + 1 if count > 0
    seen[count] ||= i
    ans = [ans, i - seen[count-1]].max if seen[count-1]
  end
  ans
end
