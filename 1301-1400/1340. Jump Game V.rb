# @param {Integer[]} arr
# @param {Integer} d
# @return {Integer}
def max_jumps(arr, d)
  n = arr.size
  f = [1] * n
  arr.map.with_index { |num, i| [num, i] }.sort.each do |num, i|
    (i-1).downto(i-d) do |j|
      break if !(0 <= j && j < n && arr[j] < arr[i])
      f[i] = f[j] + 1 if f[j]+1 > f[i]
    end
    (i+1..i+d).each do |j|
      break if !(0 <= j && j < n && arr[j] < arr[i])
      f[i] = f[j] + 1 if f[j]+1 > f[i]
    end
  end
  f.max
end
