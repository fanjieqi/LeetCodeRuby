# @param {String} s
# @return {Integer}
def length_of_last_word(s)
  s.split(" ").last&.length.to_i
end
