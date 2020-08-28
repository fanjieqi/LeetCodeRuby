# @param {Integer[]} target
# @return {Boolean}
def is_possible(target)
  total = target.sum
  target.sort!
  loop do
    tmp = target.pop
    total -= tmp
    return true if tmp == 1 || total == 1
    return false if tmp < total || total == 0 || tmp % total == 0
    tmp %= total
    total += tmp
    i = target.bsearch_index { |ele| ele >= tmp } || target.size
    target.insert(i, tmp)
  end
end
