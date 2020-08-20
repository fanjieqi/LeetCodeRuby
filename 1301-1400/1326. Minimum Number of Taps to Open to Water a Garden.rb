MAX = 1 << 31
# @param {Integer} n
# @param {Integer[]} ranges
# @return {Integer}
def min_taps(n, ranges)
  hash = {}
  ranges.each_with_index do |range, i|
    next if range == 0
    l, r = [i-range, 0].max, [i+range, n].min
    hash[l] = [hash[l].to_i, r].max
  end
  intervals = []
  hash.sort.each { |l, r| intervals << [l, r] if intervals.empty? || r > intervals[-1][1] }
  f = [] 
  f[0] = 0 if intervals.dig(0, 0) == 0
  intervals.each_with_index do |(l, r), i|
    min, k = MAX, nil
    (l..r).each do |j|
      break if f[j].nil?
      k = j + 1
      min = f[j] if f[j] < min
    end
    return -1 if min == MAX
    (k..r).each do |j|
      f[j] = min + 1
    end
  end
  f[n] || -1
end
