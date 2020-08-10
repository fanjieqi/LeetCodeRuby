# @param {Integer} upper
# @param {Integer} lower
# @param {Integer[]} colsum
# @return {Integer[][]}
def reconstruct_matrix(upper, lower, colsum)
  n0, n1 = [], []
  colsum.each_with_index do |count, i|
    if count == 2
      n0[i] = 1
      n1[i] = 1
      upper -= 1
      lower -= 1
    elsif count == 0
      n0[i] = 0
      n1[i] = 0
    elsif upper > lower
      n0[i] = 1
      n1[i] = 0
      upper -= 1
    else
      n0[i] = 0
      n1[i] = 1
      lower -= 1
    end
    return [] if upper < 0 || lower < 0
  end
  return [] if upper > 0 || lower > 0
  [n0, n1]
end
