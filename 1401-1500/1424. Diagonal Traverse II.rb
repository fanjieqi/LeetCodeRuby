# @param {Integer[][]} nums
# @return {Integer[]}
def find_diagonal_order(nums)
  arr = []
  nums.each_with_index do |row, i|
    row.each_with_index do |num, j|
      arr[i+j] ||= []
      arr[i+j] << num
    end
  end
  arr.map(&:reverse).flatten
end
