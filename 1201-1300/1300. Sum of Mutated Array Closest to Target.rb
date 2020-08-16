# @param {Integer[]} arr
# @param {Integer} target
# @return {Integer}
def find_best_value(arr, target)
  n, min = arr.size, arr.min
  arr.sort!
  arr.each_with_index do |num, i|
    count = n-i
    tmp = count * num
    if tmp == target
      return num 
    elsif tmp < target
      target -= num
    else
      m = (target / count.to_f).round
      m -= 1 if (target - (m-1) * count).abs <= (target - m * count).abs
      return m
    end
  end
  arr.last
end
