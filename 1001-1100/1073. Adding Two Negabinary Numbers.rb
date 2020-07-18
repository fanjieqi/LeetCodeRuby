# @param {Integer[]} arr1
# @param {Integer[]} arr2
# @return {Integer[]}
def add_negabinary(arr1, arr2)
  arr1, arr2 = arr2, arr1 if arr1.size < arr2.size
  arr1.reverse!
  arr2.reverse!
  (0..arr2.size-1).each { |i| arr1[i] += arr2[i] }
  i = 0
  while i < arr1.size
    if arr1[i] == 2
      arr1[i] = 0
      arr1[i+1] ||= 0
      arr1[i+1] -= 1
    elsif arr1[i] == -1
      arr1[i] = 1
      arr1[i+1] ||= 0
      arr1[i+1] += 1
    elsif arr1[i] == 3
      arr1[i] = 1
      arr1[i+1] ||= 0
      arr1[i+1] -= 1
    end
    i += 1
  end
  arr1.pop while arr1.size > 1 && arr1[-1].zero?
  arr1.reverse
end
