# @param {Integer[]} a
# @param {Integer[]} b
# @return {Integer[]}
def advantage_count(a, b)
  a.sort!
  b.map { |num| begin a.delete_at(a.bsearch_index { |ele| ele > num }) rescue a.shift end }
end
