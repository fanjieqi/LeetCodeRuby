# @param {String} a
# @param {String} b
# @return {String[]}
def uncommon_from_sentences(a, b)
  a = a.split(" ").group_by(&:itself)
  b = b.split(" ").group_by(&:itself)
  c = a.select { |ele, array| array.size > 1 }.map(&:first)
  d = b.select { |ele, array| array.size > 1 }.map(&:first)
  ((a.keys - b.keys) | (b.keys - a.keys)) - c - d
end
