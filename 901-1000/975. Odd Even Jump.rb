# @param {Integer[]} a
# @return {Integer}
def odd_even_jumps(a)
  n = a.size
  next_higher, next_lower = [0] * n, [0] * n

  stack = []
  asc = a.map.with_index { |num, i| [num, i] }.sort
  asc.each do |num, i|
    next_higher[stack.pop] = i while !stack.empty? && stack[-1] < i
    stack << i
  end

  stack = []
  desc = a.map.with_index { |num, i| [-num, i] }.sort
  desc.each do |num, i|
    next_lower[stack.pop] = i while !stack.empty? && stack[-1] < i
    stack << i
  end

  higher, lower = [0] * n, [0] * n
  higher[-1], lower[-1] = 1, 1
  (n-2).downto(0) do |i|
    higher[i] = lower[next_higher[i]]
    lower[i] = higher[next_lower[i]]
  end
  higher.sum
end
