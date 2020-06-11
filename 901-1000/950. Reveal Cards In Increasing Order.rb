# @param {Integer[]} deck
# @return {Integer[]}
def deck_revealed_increasing(deck)
  deck = deck.sort
  array = []
  (deck.size).times do |i|
    array.unshift(deck.pop)
    array.insert(1, array.pop) if array.size > 1
  end
  array
end
