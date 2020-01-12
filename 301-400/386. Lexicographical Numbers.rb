# @param {Integer} n
# @return {Integer[]}
def lexical_order(n)
  (1..n).map(&:to_s).sort.map(&:to_i)
end
