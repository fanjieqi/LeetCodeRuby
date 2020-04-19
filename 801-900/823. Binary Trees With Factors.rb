# @param {Integer[]} a
# @return {Integer}
def num_factored_binary_trees(a)
  hash = {}
  a.sort.each do |n1|
    hash[n1] = 1 + a.map { |n2| n2<n1 && n1%n2==0 ? hash[n2] * hash[n1/n2].to_i : 0 }.sum
  end
  hash.values().sum % (10**9 + 7)
end
