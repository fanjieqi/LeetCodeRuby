# @param {String} version1
# @param {String} version2
# @return {Integer}
def compare_version(version1, version2)
  v1 = version1.split(".").map(&:to_i)
  v2 = version2.split(".").map(&:to_i)
  v1.pop while v1.length > 0 && v1.last.zero?
  v2.pop while v2.length > 0 && v2.last.zero?
  min = [v1, v2].min
  v1 == v2 ? 0 : v2 == min ? 1 : -1
end
