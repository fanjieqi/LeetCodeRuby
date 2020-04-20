# @param {Integer[]} difficulty
# @param {Integer[]} profit
# @param {Integer[]} worker
# @return {Integer}
def max_profit_assignment(difficulty, profit, worker)
  array = difficulty.zip(profit).sort_by(&:first)
  array.each_with_index do |(diff, profit), i|
    array[i][1] = array[i-1][1] if i > 0 && array[i-1][1] > array[i][1]
  end
  array.reverse!

  sum = 0
  worker.each do |ability|
    i = array.bsearch_index { |ele| ability >= ele[0] }
    sum += array[i][1] if i
  end
  sum
end
