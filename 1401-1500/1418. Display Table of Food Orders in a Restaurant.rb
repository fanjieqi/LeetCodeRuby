# @param {String[][]} orders
# @return {String[][]}
def display_table(orders)
  tables, foods = {}, {}
  orders.each do |name, i, food|
    tables[i] ||= {}
    tables[i][food] ||= 0
    tables[i][food] += 1
    foods[food] = true
  end
  ans = []
  foods = foods.keys.sort
  ans << ["Table"] + foods
  tables.keys.sort_by(&:to_i).each do |table|
    ans << [table] + foods.map { |food| tables[table][food].to_i.to_s }
  end
  ans
end
