# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[][]}
def k_smallest_pairs(nums1, nums2, k)
  ans = []
  nums1.each do |n1|
    nums2.each do |n2|
      if ans.length < k
        ans << [n1, n2]
        ans = ans.sort_by(&:sum)
      elsif n1 + n2 <= ans.last.sum
        i = ans.bsearch_index{|ele| n1 + n2 <= ele.sum}
        ans = ans.insert(i, [n1, n2])[0..k-1]
      end
    end
  end
  ans
end
