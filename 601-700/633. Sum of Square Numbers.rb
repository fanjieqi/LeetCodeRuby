# @param {Integer} c
# @return {Boolean}
def judge_square_sum(c)
  k = Math.sqrt(c)
  (0..k).any? {|i| Math.sqrt(c - (i**2)).to_i**2 == c - (i**2) } 
end
