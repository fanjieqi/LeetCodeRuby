# @param {Integer} n
# @return {Integer}
def bitwise_complement(n)
  n.to_s(2).split("").map{|i| (1-i.to_i).to_s }.join.to_i(2)
end
