MAX = 1 << 31

# @param {String[]} a
# @return {String}
def shortest_superstring(a)
  hash = {}
  (0..a.size-1).each do |i|
    l1 = a[i].size
    l1.downto(1) do |l|
      (0..a.size-1).each do |j|
        next if i == j
        next if a[i][-l..-1] != a[j][0, l] || hash.dig(i, j) && (l < hash[i][j])
        hash[i] ||= {}
        hash[i][j] = l
      end
    end
  end
  min = a.join
  return min if hash.values.all?(&:nil?)

  queue = Queue.new
  indexes = (0..a.size-1).to_a
  indexes.each { |i| queue << [[i], a[i]] }
  while !queue.empty?
    array, str = queue.pop
    next if str.size >= min.size

    tmp = str + (indexes - array).map { |i| a[i] }.join
    min = tmp if tmp.size < min.size

    if array.size == a.size
      min = str if str.size < min.size
    else
      flag = true
      hash[array[-1]].each do |j, l|
        next if array.include?(j)
        tmp = str + a[j][l..-1]
        next if tmp.size >= min.size
        flag = false
        queue << [array + [j], tmp]
      end if hash[array[-1]]

      if flag
        (indexes - array).each do |j|
          tmp = str + a[j]
          next if tmp.size >= min.size
          queue << [array + [j], tmp]
        end if hash[array[0]]
      end
    end
  end
  min
end
