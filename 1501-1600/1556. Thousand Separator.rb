# @param {Integer} n
# @return {String}
def thousand_separator(n)
  n.to_s.reverse.chars.each_slice(3).map(&:reverse).map(&:join).reverse.join('.')
end
