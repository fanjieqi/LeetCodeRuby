# @param {Integer[]} a
# @return {Integer}
def num_squareful_perms(a)
  map = []
  (0..a.size-2).each do |i|
    map[i] ||= []
    (i+1..a.size-1).each do |j|
      sum = a[i] + a[j]
      map[j] ||= []
      tmp = Math.sqrt(sum)
      if (tmp.ceil == tmp.floor) && (tmp**2 == sum)
        map[i] << j
        map[j] << i
      end
    end
  end

  count, mark = 0, {}
  queue = Queue.new
  (0..a.size-1).each do |u|
    next if map[u].size == 0
    queue << [[u], [a[u]]]
  end

  while !queue.empty?
    indexes, permutations = queue.pop
    u = indexes.last
    map[u].each do |v|
      next if indexes.include?(v)
      key = permutations + [a[v]]
      next if mark[key]
      mark[key] = true
      if indexes.size == a.size - 1
        count += 1
      else
        queue << [indexes + [v], key]
      end
    end
  end
  count
end
