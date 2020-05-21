# @param {Integer[]} people
# @param {Integer} limit
# @return {Integer}
def num_rescue_boats(people, limit)
  people.sort!
  count, rest = 0, limit
  while !people.empty?
    weight = people.pop
    rest -= weight
    count += 1
    if !people.empty?
      i = people.bsearch_index { |ele| ele >= rest } || people.size - 1
      if people[i] <= rest
        rest -= people[i]
        people.delete_at(i)
      elsif i > 0
        rest -= people[i-1]
        people.delete_at(i-1)
      end
    end
    rest = limit
  end
  count
end
