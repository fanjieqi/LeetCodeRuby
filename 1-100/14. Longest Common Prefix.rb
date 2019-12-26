# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.length == 0
  l = 0
  min_str = strs.min_by(&:length)
  r = min_str.length - 1
  while  l <= r
    m = (l + r) / 2
    if strs.all?{|str| str[m] == min_str[m]}
      l = m+1
    else
      r = m-1
    end
  end

  r >= 0 && strs.all?{|str| str[min_str[0..r]]} ? min_str[0..r] : ""
end
