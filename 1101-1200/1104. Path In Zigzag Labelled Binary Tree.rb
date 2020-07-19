# @param {Integer} label
# @return {Integer[]}
def path_in_zig_zag_tree(label)
  ans = []
  while label >= 1
    ans.unshift(label)
    label /= 2
  end
  l, r = 1, 1
  (0..ans.size-1).each do |i|
    ans[i] = l + r - ans[i] if i.even? && ans.size.even? || i.odd? && ans.size.odd?
    l = l * 2
    r = r * 2 + 1
  end
  ans
end
