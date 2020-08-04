# @param {String} text
# @return {Integer}
def max_number_of_balloons(text)
  hash = text.chars.group_by(&:itself).transform_values(&:count)
  [hash['b'].to_i, hash['a'].to_i, hash['l'].to_i / 2, hash['o'].to_i / 2, hash['n'].to_i].min
end
