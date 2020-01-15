# @param {String} num
# @param {Integer} k
# @return {String}
def remove_kdigits(num, k)
  return "0" if num.length == 0 || num[/^0+$/] || num.length <= k
  return num if k == 0
    
  if num[0] > num[1]
    remove_kdigits(num[1..-1].gsub(/^0+/, ""), k - 1) 
  else
    index0 = num.index("0")
    if index0
      index = 0
      index += 1 while index < index0 && num[index] <= num[index+1]
      index.zero? ? remove_kdigits(num[1..-1], k-1) : remove_kdigits(num[0..index-1]+num[index+1..-1], k - 1)
    else
      index = (1..num.length-1).find { |i| num[i-1] < num[i] }
      index.nil? ? remove_kdigits(num[1..-1], k-1) : remove_kdigits(num[0..index-1]+num[index+1..-1], k - 1)
    end
  end
end
