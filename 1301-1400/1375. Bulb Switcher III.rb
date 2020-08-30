# @param {Integer[]} light
# @return {Integer}
def num_times_all_blue(light)
  max, count, status = 0, 0, []
  light.each_with_index do |i, j|
    status[i] = 1
    max += 1 while status[max+1] == 1
    count += 1 if max == j + 1
  end
  count
end
