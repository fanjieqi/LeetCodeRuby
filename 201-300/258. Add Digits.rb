# @param {Integer} num
# @return {Integer}
def add_digits(num)
  num = num.to_s.split("").map(&:to_i).sum while num.to_s.length > 1
  num
end
