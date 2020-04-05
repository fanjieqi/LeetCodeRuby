# @param {String} s
# @return {String}
def reorganize_string(s)
  array = s.split("").group_by(&:itself).transform_values(&:count).sort_by(&:last)
  ans = ""
  while !array.empty?
    ele, count = array.pop
    return "" if array.size == 0 && count > 1
    return ans + ele if array.size == 0 && count == 1
    while array.size > 0 && array[-1][1] <= count
      ans += array[-1][1].times.map{ ele + array[-1][0] }.join
      count -= array.pop[1]
    end
    if count > 0
      i = array.bsearch_index { |e, c| c >= count } || -1
      array.insert(i, [ele, count])
    end
  end
  ans
end
