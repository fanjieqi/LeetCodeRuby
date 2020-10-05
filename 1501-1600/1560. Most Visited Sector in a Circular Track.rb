# @param {Integer} n
# @param {Integer[]} rounds
# @return {Integer[]}
def most_visited(n, rounds)
  count = []
  (1..n).each do |i|
    (0..rounds.size-2).each do |j|
      if rounds[j] < rounds[j+1] && rounds[j] <= i && i < rounds[j+1] || \
        rounds[j] > rounds[j+1] && (rounds[j] <= i || i < rounds[j+1])
        count[i] = count[i].to_i + 1
      end
    end
    count[i] = count[i].to_i + 1 if rounds[-1] == i
  end
  max = count.compact.max
  (1..n).select { |i| count[i] == max }
end
