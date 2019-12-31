# @param {String} s
# @return {String}
def reverse_words(s)
  s.strip.split(/\s+/).reverse.join(" ")
end
