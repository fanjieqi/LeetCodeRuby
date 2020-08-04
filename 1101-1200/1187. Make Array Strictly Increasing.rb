MAX = 1 << 31

def get_bigger(num)
  i = @arr2.bsearch_index { |ele| ele > num }
  i.nil? ? nil : @arr2[i]
end

def dfs(i, num)
  return 0 if i == @arr1.size
  return @hash[i][num] if @hash.dig(i, num)
  res1 = @arr1[i] > num ? dfs(i + 1, @arr1[i]) : MAX
  bigger = get_bigger(num)
  res2 = bigger.nil? ? MAX : dfs(i + 1, bigger)
  @hash[i] ||= {}
  @hash[i][num] = [res1, res2 + 1].min
end

# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer}
def make_array_increasing(arr1, arr2)
  @arr1, @arr2 = arr1, arr2.uniq.sort
  @hash = {}
  ans = dfs(0, -MAX)
  ans != MAX ? ans : -1
end
