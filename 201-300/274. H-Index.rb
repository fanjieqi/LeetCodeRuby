# @param {Integer[]} citations
# @return {Integer}
def h_index(citations)
  max = 0
  citations.sort.reverse.each_with_index do |count, i|
    max += 1 if count > max
  end
  max
end
