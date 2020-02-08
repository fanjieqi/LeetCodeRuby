# @param {String} s
# @return {Boolean}
def check_record(s)
  s.scan("A").count <= 1 && s.scan(/L+/).map(&:length).max.to_i <= 2
end
