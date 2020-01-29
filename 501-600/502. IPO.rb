# @param {Integer} k
# @param {Integer} w
# @param {Integer[]} profits
# @param {Integer[]} capital
# @return {Integer}
def find_maximized_capital(k, w, profits, capital)
  current = []
  future = capital.zip(profits).sort.reverse
  k.times do |i|
    while !future.empty? && future[-1][0] <= w
      tmp = -future.pop[1]
      i = current.bsearch_index{|x| x >= tmp} || -1
      current.insert(i, tmp)
    end
    w -= current.shift if !current.empty?
  end
  w
end
