# @param {Integer[]} target
# @param {Integer} n
# @return {String[]}
def build_array(target, n)
  arr, i = [], 0
  (1..n).each do |num|
    break if target[i].nil?
    if num == target[i]
      arr << 'Push'
      i += 1
    else
      arr << 'Push'
      arr << 'Pop'
    end
  end
  arr
end
