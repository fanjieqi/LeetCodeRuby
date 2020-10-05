# @param {Integer[]} arr
# @param {Integer} m
# @return {Integer}
def find_latest_step(arr, m)
  left, right, max = {}, {}, -1
  arr.each_with_index do |mid, i|
    if right[mid-1].nil? && left[mid+1].nil?
      left[mid] = mid
      right[mid] = mid
      max = i + 1 if m == 1
    elsif right[mid-1].nil? && left[mid+1]
      r = left.delete(mid+1)
      max = i if r - mid == m
      left[mid] = r
      right[r] = mid
      max = i + 1 if r - mid +1 == m
    elsif right[mid-1] && left[mid+1].nil?
      l = right.delete(mid-1)
      max = i if mid - l == m
      left[l] = mid
      right[mid] = l
      max = i + 1 if mid - l +1 == m
    elsif right[mid-1] && left[mid+1]
      l = right[mid-1]
      max = i if mid - l == m
      r = left[mid+1]
      max = i if r - mid == m
      left[l] = r
      right[r] = l
      max = i + 1 if r - l +1 == m
    end
  end
  max
end
