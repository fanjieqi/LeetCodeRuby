# @param {Integer[][]} mat
# @return {Integer}
def min_flips(mat)
  m, n, s, @hash = mat.size, mat[0].size, mat.join.to_i(2), {}
  
  map = []
  (0..(1 << (m*n))-1).each do |u|
    map[u] ||= {}
    u = u.clone.to_s(2).rjust(m*n, '0')
    (0..(m*n-1)).each do |i|
      v = u.clone
      v[i] = (v[i] == '0' ? '1' : '0') 
      v[i-1] = (v[i-1] == '0' ? '1' : '0') if i-1 >= 0 && i % n != 0
      v[i+1] = (v[i+1] == '0' ? '1' : '0') if i+1 < m*n && (i+1) % n != 0
      v[i-n] = (v[i-n] == '0' ? '1' : '0') if i-n >= 0
      v[i+n] = (v[i+n] == '0' ? '1' : '0') if i+n < m*n
      map[u.to_i(2)][v.to_i(2)] = true
    end
  end

  dist = { s => 0 }
  queue = Queue.new
  queue << s
  while !queue.empty?
    u = queue.pop
    tmp = dist[u] + 1
    map[u].each do |v, _|
      next if dist[v] && tmp >= dist[v]
      dist[v] = tmp
      queue << v
    end if map[u]
  end

  dist[0] || -1
end
