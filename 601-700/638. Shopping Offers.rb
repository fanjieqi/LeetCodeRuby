# @param {Integer[]} price
# @param {Integer[][]} special
# @param {Integer[]} needs
# @return {Integer}
def shopping_offers(prices, special, needs)
  min = needs.zip(prices).map{|need, price| need * price}.sum

  needs_hash = needs.hash
  hash = {needs_hash => min}
  queue = Queue.new
  queue << [needs.map{0}, 0]
  while !queue.empty?
    current, sum = queue.pop

    special.each do |ele|
      new_price = sum + ele.last
      next if new_price > hash[needs_hash]

      result = current.map.with_index{|num, i| num + ele[i]}
      rest = needs.zip(result).map{|need, num| need - num}
      next if rest.any?(&:negative?)

      rest_price = rest.map.with_index {|tmp, i| tmp * prices[i] }.sum
      hash[needs_hash] = new_price + rest_price if new_price + rest_price < hash[needs_hash]

      result_hash = result.hash
      if (hash[result_hash].nil? || new_price < hash[result_hash])
        hash[result_hash] = new_price
        queue << [result, new_price]
      end
    end
  end

  hash[needs_hash]
end
