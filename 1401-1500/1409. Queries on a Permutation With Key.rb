# @param {Integer[]} queries
# @param {Integer} m
# @return {Integer[]}
def process_queries(queries, m)
  arr = (1..m).to_a
  hash = {}
  prefix = []
  (0..queries.size-1).map do |i|
    if hash[queries[i]]
      j = prefix.index(queries[i])
      k = j
      prefix.unshift(prefix.delete_at(j))
    else
      j = arr.bsearch_index { |ele| ele >= queries[i] }
      k = prefix.size + j
      prefix.unshift(arr.delete_at(j))
    end
    hash[queries[i]] = true
    k
  end
end
