# The is_bad_version API is already defined for you.
# @param {Integer} version
# @return {boolean} whether the version is bad
# def is_bad_version(version):

# @param {Integer} n
# @return {Integer}
def first_bad_version(n)
  l = 1
  r = n
  res = nil
  while l < r
    mid = (l + r) / 2
    res = is_bad_version(mid)
    if res
      r = mid - 1
    else
      l = mid + 1
    end
  end
  is_bad_version(l) ? l : l + 1
end
