# @param {String} s
# @param {Integer[]} indexes
# @param {String[]} sources
# @param {String[]} targets
# @return {String}
def find_replace_string(s, indexes, sources, targets)
  array = indexes.zip(sources).zip(targets).map(&:flatten).sort_by(&:first)
  offset = 0
  array.each do |index, source, target|
    pos = index + offset
    if s[pos,source.size] == source
      s.sub!(/(?<=\w{#{pos}})#{source}/, target)
      offset += target.size - source.size
    end
  end
  s
end
