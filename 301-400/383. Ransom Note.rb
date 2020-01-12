# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)
  h1 = ransom_note.split("").group_by(&:itself).transform_values(&:count)
  h2 = magazine.split("").group_by(&:itself).transform_values(&:count)
  h1.all? {|k, v| v <= h2[k].to_i}
end
