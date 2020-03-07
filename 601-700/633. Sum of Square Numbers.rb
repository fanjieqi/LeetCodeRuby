# @param {Integer} c
# @return {Boolean}
def judge_square_sum(c)
  (0..Math.sqrt(c)).any? {|i| Math.sqrt(c - (i**2)).to_i**2 == c - (i**2) } 
end
