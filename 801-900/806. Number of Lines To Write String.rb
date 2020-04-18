# @param {Integer[]} widths
# @param {String} s
# @return {Integer[]}
def number_of_lines(widths, s)
  count, current = 1, 0
  hash = ('a'..'z').map.with_index { |c, i| [c, widths[i]] }.to_h
  s.each_char do |c|
    tmp = current + hash[c]
    if tmp < 100
      current = tmp
    elsif tmp == 100
      current = 0
      count += 1
    else
      current = hash[c]
      count += 1
    end
  end
  [count, current]
end
