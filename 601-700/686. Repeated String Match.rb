# @param {String} a
# @param {String} b
# @return {Integer}
def repeated_string_match(a, b)
  return 1 if a[b]
  tmp = b.split(a)
  return b.size / a.size if tmp.empty?
  return (a*2)[b] ? 2 : -1 if tmp.size == 1
  return a.start_with?(tmp.last) ? tmp.size : -1 if tmp.first.empty? && tmp.last
  return a.end_with?(tmp.first) ? tmp.size : -1 if tmp.first && tmp.last.empty?
  tmp[1..-2].all?(&:empty?) && a.start_with?(tmp.last) && a.end_with?(tmp.first) ? tmp.size + 1 : -1
end
