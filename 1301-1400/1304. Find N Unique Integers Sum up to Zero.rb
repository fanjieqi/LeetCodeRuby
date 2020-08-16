# @param {Integer} n
# @return {Integer[]}
def sum_zero(n)
  tmp = (1..n/2).to_a
  tmp += tmp.map { |num| -num }
  tmp += [0] if n.odd?
  tmp
end
