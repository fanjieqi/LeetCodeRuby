# @param {String} a
# @param {String} b
# @return {Boolean}
def rotate_string(a, b)
  a == b || (0..a.size-2).any? {|i| a[i+1..-1] + a[0..i] == b }
end
