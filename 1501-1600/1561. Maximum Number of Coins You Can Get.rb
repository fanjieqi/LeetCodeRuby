# @param {Integer[]} piles
# @return {Integer}
def max_coins(piles)
  piles.sort[piles.size/3..-1].each_slice(2).inject(0) { |sum, pile| sum + pile[0] }
end
