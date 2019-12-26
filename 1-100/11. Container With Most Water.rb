# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  ans = 0  
  i = 0
  j = height.length - 1
  while j > i
    if height[i] < height[j]
      ans = [ans, height[i] * (j-i)].max
      i += 1
    else
      ans = [ans, height[j] * (j-i)].max
      j -= 1
    end
  end
  ans
end
