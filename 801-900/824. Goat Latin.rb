# @param {String} s
# @return {String}
def to_goat_latin(s)
  s.split(" ").map.with_index { |c, i| (c[/^[aeiouAEIOU]/] ? c : c[1..-1] + c[0]) + "ma" + "a"*(i+1) }.join(" ")
end
