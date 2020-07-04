# @param {String[]} a
# @return {String[]}
def common_chars(a)
  array = a.map { |str| str.split("").group_by(&:itself).transform_values(&:count) }
  chars = array.map(&:keys).inject(&:&)
  ans = []
  chars.each do |char|
    min = array.map { |hash| hash[char] }.compact.min
    ans += [char] * min
  end
  ans
end
