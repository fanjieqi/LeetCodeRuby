def dfs(arr)
  return arr if arr.size == 1
  odd, even = [], []
  arr.each_with_index do |num, i|
    if i.even?
      even << num
    else 
      odd << num
    end
  end
  dfs(even) + dfs(odd)
end

# @param {Integer} n
# @return {Integer[]}
def beautiful_array(n)
  arr = (1..n).to_a
  dfs(arr)
end
