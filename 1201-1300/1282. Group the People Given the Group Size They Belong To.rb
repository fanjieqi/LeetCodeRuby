# @param {Integer[]} group_sizes
# @return {Integer[][]}
def group_the_people(group_sizes)
  n, ans = group_sizes.size, []
  hash =(0..n-1).group_by { |i| group_sizes[i] }
  hash.each { |key, array| ans += array.each_slice(key).to_a }
  ans
end
