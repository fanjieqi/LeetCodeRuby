# @param {Integer[]} arr
# @return {Integer}
def find_lucky(arr)
  arr.inject({}) { |hash, num| hash.merge(num => hash[num].to_i + 1) }.select { |num, count| num == count }.keys.sort[-1] || -1
end
