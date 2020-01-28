# @param {Integer} n
# @return {Integer}
def magical_string(n)
  arr = [1, 2, 2]
  i = 2
  j = 1
  while arr.length < n
    arr << j
    arr << j if arr[i] == 2
    j = 3-j
    i += 1
  end
  arr[0,n].select(&:odd?).count
end
