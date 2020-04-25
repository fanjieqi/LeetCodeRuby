def get_father(i)
  (@father[i].nil? || @father[i] == i) ? i : @father[i] = get_father(@father[i])
end

def is_same_group(s1, s2)
  sum = 0
  (0..s1.size-1).each do |k|
    if s1[k] != s2[k]
      if sum < 2
        sum += 1
      else
        return false
      end
    end
  end
  true
end

# @param {String[]} a
# @return {Integer}
def num_similar_groups(a)
  @father = (0..a.size-1).map(&:itself)
  m, n = a[0].size, a.size

  if m > n
    (0..a.size-2).each do |i|
      (i+1..a.size-1).each do |j|
        next if a[i].size != a[j].size
        @father[get_father(j)] = get_father(i) if is_same_group(a[i], a[j])
      end
    end
  else
    hash = a.each_index.inject({}) { |tmp, i| tmp.merge!(a[i] => i) }
    a.each_with_index do |str, k|
      (0..str.size-1).to_a.combination(2).each do |i, j|
        str[i], str[j] = str[j], str[i]
        k1 = hash[str]
        @father[get_father(k1)] = get_father(k) if k1
        str[i], str[j] = str[j], str[i]
      end
    end
  end
  (0..a.size-1).map { |i| get_father(i) }.uniq.size
end
