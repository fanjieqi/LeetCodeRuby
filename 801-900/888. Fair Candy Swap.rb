# @param {Integer[]} a
# @param {Integer[]} b
# @return {Integer[]}
def fair_candy_swap(a, b)
  asum, bsum = a.sort!.sum, b.sort!.sum
  sum = (asum + bsum) / 2
  a.each do |num|
    need = sum - (asum - num)
    return [num, need] if need == b.bsearch { |ele| ele >= need }
  end
end
