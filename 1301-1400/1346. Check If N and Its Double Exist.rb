# @param {Integer[]} arr
# @return {Boolean}
def check_if_exist(arr)
  hash = {}
  arr.each { |num| hash[num] = hash[num].to_i + 1 }
  arr.any? { |num| num == 0 ? hash[num] > 1 : hash[num * 2] }
end
