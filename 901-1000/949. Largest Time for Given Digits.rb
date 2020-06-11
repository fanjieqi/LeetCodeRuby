# @param {Integer[]} a
# @return {String}
def largest_time_from_digits(a)
  a.permutation(4).map { |i, j, k, l| "#{i}#{j}:#{k}#{l}" }.select do |time|
    time[/(2[0-3]|[0-1]\d)\:[0-5]\d/]
  end.max.to_s
end
