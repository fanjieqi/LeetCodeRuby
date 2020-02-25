# @param {Integer} m
# @param {Integer} n
# @param {Integer[][]} ops
# @return {Integer}
def max_count(m, n, ops)
  return m * n if ops.size == 0
  ops.map(&:first).min * ops.map(&:last).min
end
