# @param {String} license_plate
# @param {String[]} words
# @return {String}
def shortest_completing_word(license_plate, words)
  hash = license_plate.downcase.scan(/[a-z]/).group_by(&:itself).transform_values(&:count)
  words.sort_by(&:length).each do |word|
    tmp = word.split("").group_by(&:itself).transform_values(&:count)
    return word if hash.all? { |c, v| tmp[c].to_i >= v }
  end
end
