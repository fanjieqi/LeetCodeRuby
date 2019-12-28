def get_count_hash(str)
  str.split("").group_by(&:itself).transform_values(&:count)
end

def get_reduce(s, s_count, t_count)
  l = 0
  r = s.length - 1
  while s_count[s[r]].to_i > t_count[s[r]].to_i
    s_count[s[r]] -= 1
    r -= 1
  end
  while s_count[s[l]].to_i > t_count[s[l]].to_i
    s_count[s[l]] -= 1
    l += 1
  end
  [l, s[l..r]]
end

def reduce_right(s, s_count, t_count)
  l = 0
  r = s.length - 1
  while s_count[s[r]].to_i > t_count[s[r]].to_i
    s_count[s[r]] -= 1
    r -= 1
  end
  s[l..r]
end

# @param {String} s
# @param {String} t
# @return {String}
def min_window(s, t)
  return "" if s.length < t.length || s.length == 0 || t.length == 0
  return s[t].to_s if t.length == 1
  t_count = get_count_hash(t)
  s_count = get_count_hash(s)
  return "" if t_count.any? {|key, v| s_count[key].to_i < v }

  l, min = get_reduce(s, s_count, t_count)
  m_count = get_count_hash(min)
  need = {}

  (l+1..s.length-t.length).each do |i|
    k = min.length
    str = s[i,k]

    m_count[s[i-1]] -= 1
    m_count[str[-1]] ||= 0
    m_count[str[-1]] += 1 if i + k - 1 < s.length

    need[s[i-1]] = true if m_count[s[i-1]] < t_count[s[i-1]].to_i
    need.delete(str[-1]) if m_count[str[-1]] >= t_count[str[-1]].to_i
    next unless need.empty?
    tmp = reduce_right(str, m_count, t_count)

    min = tmp if tmp.length < min.length
  end

  min
end
