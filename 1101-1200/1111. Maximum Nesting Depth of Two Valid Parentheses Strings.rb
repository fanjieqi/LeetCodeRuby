# @param {String} seq
# @return {Integer[]}
def max_depth_after_split(seq)
  seq.chars.map.with_index { |char, i| i & 1 ^ (seq[i] == '(' ? 1 : 0) }
end
