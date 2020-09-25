# @param {Integer[][]} mat
# @param {Integer} k
# @return {Integer}
def kth_smallest(mat, k)
  arr = nil
  mat.each_with_index do |row, i|
    if i == 0
      arr = row[0, k]
    else
      tmp = []
      arr.each do |basic|
        row.each do |num|
          cur = basic + num
          j = tmp.bsearch_index { |ele| ele >= cur } || tmp.size
          next if j == k
          tmp.insert(j, cur)
          tmp.pop if tmp.size > k
        end
      end
      arr = tmp.clone
    end
  end
  arr[k-1]
end
