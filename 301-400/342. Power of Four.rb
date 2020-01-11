# @param {Integer} num
# @return {Boolean}
def is_power_of_four(num)
  return false if num == 0
  num /= 4 while num % 4 == 0
  num == 1
end
