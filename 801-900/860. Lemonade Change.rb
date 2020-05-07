# @param {Integer[]} bills
# @return {Boolean}
def lemonade_change(bills)
  count_5, count_10 = 0, 0
  bills.each do |bill|
    if bill == 5
      count_5 += 1
    elsif bill == 10
      return false if count_5 == 0
      count_5 -= 1
      count_10 += 1
    elsif bill == 20
      if count_10 > 0 && count_5 > 0
        count_10 -= 1
        count_5 -= 1
      elsif count_10 == 0 && count_5 >= 3
        count_5 -= 3
      else
        return false
      end
    end
  end
  true
end
