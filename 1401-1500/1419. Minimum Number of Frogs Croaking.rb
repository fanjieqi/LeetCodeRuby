# @param {String} croaks
# @return {Integer}
def min_number_of_frogs(croaks)
  counts = {}
  croaks.each_char { |char| counts[char] = counts[char].to_i + 1 }
  return -1 if counts.values.uniq.size != 1

  count = 0
  while croaks.size > 0
    return -1 if croaks[0] != 'c'
    i = 0
    while i
      %w(c r o a k).each do |char|
        i = croaks.index(char, i)
        break if i.nil?
        croaks[i] = ''
      end
    end
    count += 1
  end
  count
end
