# @param {String} s
# @return {Integer}
def max_power(s)
  s.scan(/(\w)(\1*)/).map(&:join).map(&:size).max
end
