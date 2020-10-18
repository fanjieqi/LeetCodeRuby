# @param {Integer[]} customers
# @param {Integer} boarding_cost
# @param {Integer} running_cost
# @return {Integer}
def min_operations_max_profit(customers, boarding_cost, running_cost)
  profit, waiting, rotate, max, index = 0, 0, 0, nil, nil
  customers.each do |customer|
    waiting += customer
    profit -= running_cost
    rotate += 1
    if waiting > 4
      profit += boarding_cost * 4
      waiting -= 4
    elsif waiting > 0
      profit += boarding_cost * waiting
      waiting = 0
    end
    if max.nil? || profit > max
      max = profit
      index = rotate
    end
  end

  while waiting > 4
    waiting -= 4
    profit += boarding_cost * 4 - running_cost
    rotate += 1
    if max.nil? || profit > max
      max = profit
      index = rotate
    end
  end
  if waiting > 0
    profit += boarding_cost * waiting - running_cost
    rotate += 1
    if max.nil? || profit > max
      max = profit
      index = rotate
    end
  end
  max > 0 ? index : -1
end
