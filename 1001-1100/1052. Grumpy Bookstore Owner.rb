# @param {Integer[]} customers
# @param {Integer[]} grumpy
# @param {Integer} x
# @return {Integer}
def max_satisfied(customers, grumpy, x)
  n = customers.size
  sum = (0..n-1).inject(0) { |sum, i| sum += (grumpy[i] == 0 ? customers[i] : 0) }
  tmp = (0..x-1).inject(0) { |sum, i| sum += (grumpy[i] == 1 ? customers[i] : 0) }
  sum += tmp
  max = sum
  (0..n-x-1).each do |i|
    sum -= customers[i] if grumpy[i] == 1
    sum += customers[i+x] if grumpy[i+x] == 1
    max = sum if sum > max
  end
  max
end
