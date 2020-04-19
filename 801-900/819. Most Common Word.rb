# @param {String} paragraph
# @param {String[]} banned
# @return {String}
def most_common_word(paragraph, banned)
  hash = paragraph.gsub(/[\!\?\'\,\;\.]/," ").split(" ").map(&:downcase).group_by(&:itself).transform_values(&:count)
  banned.each { |ban| hash.delete(ban) }
  hash.sort_by(&:last).last[0]
end
