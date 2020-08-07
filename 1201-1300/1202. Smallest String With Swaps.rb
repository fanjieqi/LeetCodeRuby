def get_father(i)
  (@father[i].nil? || @father[i] == i) ? i : @father[i] = get_father(@father[i])
end

# @param {String} s
# @param {Integer[][]} pairs
# @return {String}
def smallest_string_with_swaps(s, pairs)
  @father = {}
  pairs.each do |i, j|
    @father[get_father(i)] = get_father(j)
  end

  indexes = (0..s.size-1).group_by { |i| get_father(i) }

  ans = []
  indexes.each do |_, array|
    array.sort_by { |i| s[i] }.each_with_index do |i, j|
      ans[array[j]] = s[i]
    end
  end
  ans.join
end
