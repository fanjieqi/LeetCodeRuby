# @param {String} s
# @param {String} t
# @return {Boolean}
def is_rational_equal(s, t)
  parse_num(s) == parse_num(t)
end

def parse_num(x)
  x =~ /(\d*)\.?(\d*)\(?(\d*)\)?/
  $1.to_r + $2.to_r / (10 ** $2.length) + ($3.length > 0 ? $3.to_r / (10 ** $3.length - 1) / (10 ** $2.length) : 0)
end
