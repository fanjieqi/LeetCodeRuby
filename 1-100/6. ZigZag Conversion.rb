# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  return s if num_rows == 1
  arr = []
  num = 0
  is_down = true
  (0..s.length-1).each do |i|
    arr[num] ||= []
    arr[num] << s[i]
    if (num == (num_rows - 1)) && is_down
      is_down = false
      num -= 1
    elsif num == 0 && !is_down
      is_down = true
      num += 1
    elsif is_down
      num += 1
    else
      num -= 1
    end
  end
  arr.flatten.join
end
