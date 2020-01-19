# @param {Integer[][]} intervals
# @return {Integer[]}
def find_right_interval(intervals)
  hash = {}
  intervals.each_with_index { |(l, r), i| hash[l] ||= i }
  arr = hash.keys.sort

  intervals.map do |l, r|
    hash[r] || hash[arr.bsearch { |i| i > r }] || -1
  end
end
