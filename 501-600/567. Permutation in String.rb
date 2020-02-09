# @param {String} s1
# @param {String} s2
# @return {Boolean}
def check_inclusion(s1, s2)
  sum = [{}]
  hash = {}
  s2.split("").each_with_index do |c, i|
    sum[i] = sum[i-1].clone
    sum[i][c] ||= 0
    sum[i][c] += 1
    hash[sum[i].hash] = true
  end

  c2 = s1.split("").group_by(&:itself).transform_values(&:count)

  s2.split("").each_with_index do |c, i|
    tmp = sum[i]
    tmp[c] -= 1
    c2.each {|k, v| tmp[k] ||= 0; tmp[k] += v}
    tmp.delete(c) if tmp[c].zero?
    return true if hash[tmp.hash]
  end
  false
end
