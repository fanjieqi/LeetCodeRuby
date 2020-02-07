# @param {Integer[]} machines
# @return {Integer}
def find_min_moves(machines)
  sum0 = machines.sum
  return -1 if sum0 % machines.size != 0

  mid, ans, sum1 = sum0 / machines.size, 0, 0
  machines.each_with_index do |machine, i|
    sum1 += machines[i-1] if i > 0
    sum0 -= machines[i]
    l = i * mid - sum1
    r = (machines.size - i - 1) * mid - sum0
    if l > 0 && r > 0
      ans = [(l + r), ans].max
    else
      ans = [ans, l.abs, r.abs].max
    end
  end
  ans
end
