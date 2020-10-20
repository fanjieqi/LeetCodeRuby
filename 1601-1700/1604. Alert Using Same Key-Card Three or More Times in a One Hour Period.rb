require 'time'

# @param {String[]} key_name
# @param {String[]} key_time
# @return {String[]}
def alert_names(key_name, key_time)
  hash = {}
  (0..key_name.size-1).each do |i|
    hash[key_name[i]] ||= []
    hash[key_name[i]] << Time.parse(key_time[i])
  end
  hash.transform_values!(&:sort)
  hash.keys.select { |name| (0..hash[name].size-3).any? { |i| hash[name][i+2] - hash[name][i] <= 60*60 } }.sort
end
