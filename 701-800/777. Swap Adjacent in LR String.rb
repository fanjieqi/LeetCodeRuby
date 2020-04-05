# @param {String} start
# @param {String} end
# @return {Boolean}
def can_transform(start, des)
  return false if start.size != des.size
  a = start.split("").map.with_index { |s, i| s[/[LR]/] ? [s, i] : nil }.compact
  b = des.split("").map.with_index { |s, i| s[/[LR]/] ? [s, i] : nil }.compact
  return false if a.size != b.size
  a.zip(b).all? { |(s, i), (e, j)| s == e && (s == 'L' && i >= j || s == 'R' && i <= j) }
end
