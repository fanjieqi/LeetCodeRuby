# @param {Integer[]} values
# @param {Integer[]} labels
# @param {Integer} num_wanted
# @param {Integer} use_limit
# @return {Integer}
def largest_vals_from_labels(values, labels, num_wanted, use_limit)
  array = values.zip(labels).sort.reverse
  ans, hash = [], {}
  array.each do |num, label|
    break if ans.size >= num_wanted
    next if hash[label].to_i >= use_limit
    hash[label] = hash[label].to_i + 1
    ans << num
  end
  ans.sum
end
