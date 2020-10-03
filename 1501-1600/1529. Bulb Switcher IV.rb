# @param {String} target
# @return {Integer}
def min_flips(target)
  count, cur = 0, '0'
  target.each_char do |char|
    next if char == cur
    count += 1
    cur = char
  end
  count
end
