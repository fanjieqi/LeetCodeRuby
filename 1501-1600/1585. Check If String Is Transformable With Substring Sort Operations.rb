# @param {String} s
# @param {String} t
# @return {Boolean}
def is_transformable(s, t)
  i, n, arr, bc = s.size-1, t.size, [], []
  (n-1).downto(0) do |j|
    if arr[0] == t[j]
      arr.shift
    elsif arr[-1] == t[j]
      arr.pop
    elsif s[i] == t[j] && arr.empty?
      i -= 1
    else
      while i >= 0 && s[i] != t[j]
        k = arr.bsearch_index { |ele| ele > s[i] } || arr.size
        arr.insert(k, s[i])
        i -= 1
      end
      return false if i >= 0 && s[i] != t[j] || i < 0 && j == 0 || s[i] == t[j] && arr[-1] && s[i] < arr[-1]
      if i >= 0
        i -= 1
      else
        bc.unshift(t[j])
      end
    end
  end
  i == -1 && arr.sort == bc.sort
end
