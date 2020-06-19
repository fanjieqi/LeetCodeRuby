# @param {Integer[]} a
# @return {Integer}
def repeated_n_times(a)
  mark = []
  a.each do |num|
    return num if mark[num]
    mark[num] = true
  end
end
