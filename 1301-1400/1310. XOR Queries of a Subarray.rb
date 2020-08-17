# @param {Integer[]} arr
# @param {Integer[][]} queries
# @return {Integer[]}
def xor_queries(arr, queries)
  xors = [0]
  arr.each_with_index { |num, i| xors[i+1] = xors[i] ^ num }
  queries.map { |l, r| xors[l] ^ xors[r+1] }
end
