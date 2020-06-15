# @param {String[]} words
# @param {String} order
# @return {Boolean}
def is_alien_sorted(words, order)
  hash = order.split("").map.with_index { |char, i| [char, i] }.to_h
  words.map.with_index { |word, i| [word.split("").map { |char| hash[char] }, i] }.sort_by(&:first).map(&:last) == (0..words.size-1).to_a
end
