def dfs(l, r, k)
  @hash[[l,r,k]] ||= (@sum[r]-@sum[l]+@a[l])/(r-l+1).to_f if k == 1

  if @hash[[l,r,k]].nil?
    max = 0
    (l..r-1).each do |i|
      next if i-l+1 < k-1
      tmp = dfs(l,i,k-1) + dfs(i+1,r,1)
      max = tmp if tmp > max
    end
    @hash[[l,r,k]] = max
  end

  @hash[[l,r,k]]
end

# @param {Integer[]} a
# @param {Integer} k
# @return {Float}
def largest_sum_of_averages(a, k)
  @a, @sum, @hash = a, [], {}
  a.each_with_index { |num, i| @sum[i] = num + @sum[i-1].to_i }
  dfs(0, a.size-1, k)
end
