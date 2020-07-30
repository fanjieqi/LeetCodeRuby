# @param {String[]} transactions
# @return {String[]}
def invalid_transactions(transactions)
  hash, invalid = {}, {}
  transactions.each_with_index do |transaction, i|
    name, time, amount, city = transaction.split(",")
    time, amount = time.to_i, amount.to_i
    invalid[i] = true if amount > 1000

    hash[name] ||= []
    left, right = time-60, time+60
    l = hash[name].bsearch_index { |time1, city1, i1| time1 >= left } || hash[name].size
    r = hash[name].bsearch_index { |time1, city1, i1| time1 >= right } || hash[name].size
    hash[name][l..r].each do |time1, city1, i1|
      next if time < left || time1 > right || city1 == city
      invalid[i1] = true
      invalid[i] = true
    end

    j = hash[name].bsearch_index { |time1, city1, i1| time1 >= time } || hash[name].size
    hash[name].insert(j, [time, city, i])
  end
  invalid.map { |i, _| transactions[i] }
end
