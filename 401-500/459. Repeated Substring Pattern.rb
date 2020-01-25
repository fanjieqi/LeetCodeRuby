# @param {String} s
# @return {Boolean}
def repeated_substring_pattern(s)
  (1..s.length-1).any? do |i|
    (s.length % i == 0) && s[/^(#{s[0,i]})+$/]
  end
end
