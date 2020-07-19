# @param {String} tiles
# @return {Integer}
def num_tile_possibilities(tiles)
  (1..tiles.size).map { |l| tiles.chars.permutation(l).map(&:join) }.flatten.uniq.count
end
