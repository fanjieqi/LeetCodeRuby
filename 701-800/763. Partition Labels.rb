# @param {String} s
# @return {Integer[]}
def partition_labels(s)
  hash = {}
  s.split("").each_with_index { |ele, i| hash[ele] ||= []; hash[ele] << i }
  pos, arr = 0, []
  (0..s.size-1).each do |i|
    count = hash.inject(0) { |sum, (ele, arr)| sum += (pos <= arr.first && arr.last <= i) ? arr.size : 0 }
    next if count != (i-pos)+1
    pos = i + 1
    arr << count
  end
  arr
end
