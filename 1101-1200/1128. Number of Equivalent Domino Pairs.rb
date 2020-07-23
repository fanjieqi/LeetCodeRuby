# @param {Integer[][]} dominoes
# @return {Integer}
def num_equiv_domino_pairs(dominoes)
  hash, count = {}, 0
  dominoes.map(&:sort!).each do |a, b|
    hash[a] ||= {}
    count += hash[a][b] if hash[a][b].to_i > 0
    hash[a][b] = hash[a][b].to_i + 1
  end
  count
end
