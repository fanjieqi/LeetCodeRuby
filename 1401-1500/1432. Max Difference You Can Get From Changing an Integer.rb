# @param {Integer} num
# @return {Integer}
def max_diff(num)
  str = num.to_s
  max, min = num, num
  str.chars.each do |x|
    ('0'..'9').each do |y|
      tmp = str.gsub(x, y).to_i
      next if tmp.to_s.size != str.size || tmp == 0
      max = tmp if tmp > max
      min = tmp if tmp < min
    end
  end
  max - min
end
