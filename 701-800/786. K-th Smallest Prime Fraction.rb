def qsort(left, right)
  return if right < @k-1 || left > @k
  l, r = left, right
  tmp = @array[(l+r)/2][2]
  while l < r
    l += 1 while @array[l][2] < tmp
    r -= 1 while tmp < @array[r][2]
    if l <= r
      @array[l], @array[r] = @array[r], @array[l]
      l += 1
      r -= 1
    end
  end
  qsort(left, r) if left < r
  qsort(l, right) if l < right
end

# @param {Integer[]} a
# @param {Integer} k
# @return {Integer[]}
def kth_smallest_prime_fraction(a, k)
  @k, @array = k, []
  magic = k / (a.size*(a.size-1)  / 2.0) * 1.03
  b = a.reverse
  a.each do |i|
    b.each do |j|
      break if i>=j
      tmp = i/j.to_f
      break if tmp > magic
      @array << [i,j,tmp]
    end
  end
  qsort(0, @array.size-1)
  @array[k-1][0..1]
end
