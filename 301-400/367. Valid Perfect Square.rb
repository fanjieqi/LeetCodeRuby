# @param {Integer} num
# @return {Boolean}
def is_perfect_square(num)
  Math.sqrt(num).round ** 2 == num
end
