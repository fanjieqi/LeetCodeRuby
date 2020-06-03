# @param {Integer[]} a
# @return {Integer[]}
def sort_array_by_parity_ii(a)
  a.select(&:even?).zip(a.select(&:odd?)).flatten
end
