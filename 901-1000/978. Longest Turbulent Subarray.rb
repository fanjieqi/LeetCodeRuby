# @param {Integer[]} a
# @return {Integer}
def max_turbulence_size(a)
  n = a.size
  odd_big, odd_small, even_big, even_small = [1] * n, [1] * n, [1] * n, [1] * n
  a.each_with_index do |num, i|
    next if i.zero?
    if num > a[i-1]
      if i.even?
        even_big[i] = odd_small[i-1] + 1
      else
        odd_big[i] = even_small[i-1] + 1
      end
    elsif num < a[i-1]
      if i.even?
        even_small[i] = odd_big[i-1] + 1
      else
        odd_small[i] = even_big[i-1] + 1
      end
    end
  end
  [odd_big.max, odd_small.max, even_big.max, even_small.max].max
end
