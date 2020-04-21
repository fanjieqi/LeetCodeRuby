# @param {Integer} n
# @return {Integer}
def consecutive_numbers_sum(n)
  (1..Math.sqrt(n*2)).map { |i| (n-i*(i-1)/2.0)/i.to_f }
                     .inject(0) {|sum, i| sum += (i>=1 && i.to_i == i ? 1 : 0) }
end
