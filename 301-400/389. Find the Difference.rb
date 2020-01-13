# @param {String} s
# @param {String} t
# @return {Character}
def find_the_difference(s, t)
  (s+t).split("").map(&:ord).inject(:^).chr
end
