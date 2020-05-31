# @param {Integer[]} deck
# @return {Boolean}
def has_groups_size_x(deck)
  counts = deck.group_by(&:itself).transform_values(&:count).values
  n = counts.shift
  counts.empty? ? n >= 2 : counts.all? { |count| (n = n.gcd(count)) && (n >= 2) }
end
