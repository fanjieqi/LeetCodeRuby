def get_father(i)
  (@father[i].nil? || @father[i] == i) ? i : @father[i] = get_father(@father[i])
end

# @param {Integer} n
# @param {Integer} threshold
# @param {Integer[][]} queries
# @return {Boolean[]}
def are_connected(n, threshold, queries)
  @father = []
  (threshold+1..n/2).each do |i|
    fi = get_father(i)
    (i..n).step(i).each do |j|
      fj = get_father(j)
      @father[fj] = fi
    end
  end
  queries.map { |u, v| get_father(u) == get_father(v) }
end
