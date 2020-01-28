# @param {Integer} num
# @return {Integer}
def find_complement(num)
  num ^ ((1<<num.to_s(2).length) - 1)
end
