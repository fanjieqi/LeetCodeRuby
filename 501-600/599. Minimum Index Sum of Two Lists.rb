# @param {String[]} list1
# @param {String[]} list2
# @return {String[]}
def find_restaurant(list1, list2)
  result = (list1 & list2).map { |name| [name, list1.index(name) + list2.index(name)] }
  min = result.map(&:last).min
  result.select{|name, sum| sum == min }.map(&:first)
end
