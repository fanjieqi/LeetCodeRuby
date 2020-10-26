# @param {Integer[]} release_times
# @param {String} keys_pressed
# @return {Character}
def slowest_key(release_times, keys_pressed)
  durations = {}
  (0..keys_pressed.size-1).each do |i|
    key = keys_pressed[i]
    if i == 0
      durations[key] = release_times[i]
    else
      tmp = release_times[i] - release_times[i-1]
      durations[key] = tmp if durations[key].nil? || tmp > durations[key]
    end
  end
  max = durations.values.max
  durations.keys.select { |key| durations[key] == max }.sort[-1]
end
