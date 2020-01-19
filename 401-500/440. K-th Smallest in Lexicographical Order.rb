# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def find_kth_number(n, k)
  result = 1;
  k -= 1
  while k > 0
    count = 0
    interval = [result, result+1]
    while interval[0] <= n
      count += ([n+1, interval[1]].min - interval[0])
      interval = [10*interval[0], 10*interval[1]]
    end
    
    if k >= count
      result += 1
      k -= count
    else
      result *= 10
      k -= 1
    end
  end
  result
end
