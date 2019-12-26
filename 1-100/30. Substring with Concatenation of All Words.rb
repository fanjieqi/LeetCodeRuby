def all_indexes(s, word)
  s.enum_for(:scan, /(?=#{word})/).map { Regexp.last_match.offset(0).first }
end

# @param {String} s
# @param {String[]} words
# @return {Integer[]}
def find_substring(s, words)
  return [] if words.length == 0

  ans = []
  arr = words.uniq.map { |w| [w, all_indexes(s, w)] }.uniq
  len = words.first.length
  all_len = words.sum(&:length)
  arr.each_with_index do |(word,indexes), i|
    indexes.each do |index|
      next if all_len > (s.length - index)
      rest = words.clone
      i = index
      while j = rest.index(s[i, len])
        rest.delete_at(j)
        i += len
      end
      ans << index if rest.length == 0
    end
  end
  ans.sort.compact.uniq
end
