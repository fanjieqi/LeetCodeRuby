# @param {String} s
# @param {Integer} k
# @return {String}
def remove_duplicates(s, k)
  i = 0
  array = []
  while tmp = s[/^([a-z])\1*/]
    s.sub!(tmp, '')
    array << [tmp[0], tmp.size]
  end
  while i = array.index { |char, l| l >= k }
    if array[i][1] == k
      array.delete_at(i)
      array[i-1][1] += array.delete_at(i)[1] while i > 0 && array[i] && array[i-1][0] == array[i][0]
    else
      array[i][1] -= k
    end
  end
  array.map { |char, i| char*i }.join
end
