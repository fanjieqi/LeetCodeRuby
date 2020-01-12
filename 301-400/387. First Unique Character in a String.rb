# @param {String} s
# @return {Integer}
def first_uniq_char(s)
  options = s.split("").group_by(&:itself).transform_values(&:count).select{|k, v| v == 1}
  options.length == 0 ? -1 : options.map{|k, v| s.index(k)}.min
end
