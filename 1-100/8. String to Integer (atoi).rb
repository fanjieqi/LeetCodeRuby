# @param {String} str
# @return {Integer}
def my_atoi(str)
  num = str.to_i
  num = [2147483647, num].min
  num = [-2147483648, num].max
end
