HOUR = "1111000000".to_i(2)
MINUTE = "0000111111".to_i(2)
# @param {Integer} num
# @return {String[]}
def read_binary_watch(num)
  return ["0:00"] if num == 0
  ans = {}
  (0..9).to_a.combination(num).each do |arr|
    s = "0000000000"
    arr.each {|i| s[i] = "1"}
    tmp = s.to_i(2)
    hour = (tmp & HOUR) >> 6
    next if hour > 11
    minute = (tmp & MINUTE)
    next if minute > 59
    ans["#{hour.to_s}:#{minute.to_s.rjust(2, "0")}"] = true
  end
  ans.keys
end
