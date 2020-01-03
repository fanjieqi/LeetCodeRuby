# @param {Integer} num
# @return {Boolean}
def is_ugly(num)
  return false if num == 0
  return true if num == 1
  loop do
    i = [2, 3, 5].find {|i| num % i == 0}
    return true if num == 1
    return false if i.nil?
    num /= i
  end
end
