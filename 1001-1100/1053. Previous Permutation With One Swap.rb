# @param {Integer[]} a
# @return {Integer[]}
def prev_perm_opt1(a)
  n = a.size
  return a if n<=1

  l = n-2
  l -= 1 while l>=0 && a[l]<=a[l+1]
  return a if l < 0
  
  r = n-1
  r -= 1 while a[r] >= a[l]
  r -= 1 while a[r] == a[r-1]
  a[l], a[r] = a[r], a[l]
  a
end
