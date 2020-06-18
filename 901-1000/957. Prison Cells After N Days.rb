# @param {Integer[]} cells
# @param {Integer} n
# @return {Integer[]}
def prison_after_n_days(cells, n)
  array, hash = [], {}
  n.times do |i|
    tmp = []
    cells.each_with_index do |num, j|
      tmp[j] = 0 < j && j < 7 && [0, 2].include?(cells[j-1] + cells[j+1]) ? 1 : 0
    end
    cells = tmp
    key = cells.join
    if hash[key]
      return array[(n - i - 1) % array.size].to_s.split("").map(&:to_i)
    else
      hash[key] = true
      array << key
    end
  end
  cells
end
