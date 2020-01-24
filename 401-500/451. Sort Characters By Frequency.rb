# @param {String} s
# @return {String}
def frequency_sort(s)
  s.split("").group_by(&:itself).transform_values(&:count).sort_by{|k, v| -v}.map{|k,v| k * v}.join
end
