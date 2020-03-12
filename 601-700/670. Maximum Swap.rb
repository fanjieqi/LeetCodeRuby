# @param {Integer} num
# @return {Integer}
def maximum_swap(num)
  arr = num.to_s.split("")
  max = num
  (0..arr.size-2).each do |i|
    (i+1..arr.size-1).each do |j|
      arr[i], arr[j] = arr[j], arr[i]
      result = arr.join.to_i 
      arr[i], arr[j] = arr[j], arr[i]
      max = result if result > max
    end
  end
  max
end
