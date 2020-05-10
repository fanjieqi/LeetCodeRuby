# @param {Integer} n
# @return {Integer}
def binary_gap(n)
  n.to_s(2).scan(/(?<=1)0*(?=1)/).map(&:size).max + 1 rescue 0
end
