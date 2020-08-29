# @param {Integer} num
# @return {Integer[]}
def closest_divisors(num)
  Math.sqrt(num+2).ceil.downto(1) do |i|
    j1 = (num + 1) / i
    j2 = (num + 2) / i
    return [i, j1] if i * j1 == (num+1)
    return [i, j2] if i * j2 == (num+2)
  end
end
