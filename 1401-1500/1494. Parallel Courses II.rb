def dfs(cur, count, array)
  return if @hash[cur] && count >= @hash[cur]
  @hash[cur] = count
  arr = (1..@n).select { |u| (cur & (1 << u) != (1 << u)) && @into[u].nil? }
  arr = arr.size > @k ? arr.combination(@k).to_a : [arr]
  arr.each do |nodes|
    tmp = cur
    nodes.each do |u|
      @map[u]&.each do |v|
        @into[v] -= 1
        @into.delete(v) if @into[v].zero?
      end
      tmp |= (1 << u)
    end

    dfs(tmp, count + 1, array + [nodes])

    nodes.each do |u|
      @map[u]&.each do |v|
        @into[v] ||= 0
        @into[v] += 1
      end
    end
  end
end

# @param {Integer} n
# @param {Integer[][]} dependencies
# @param {Integer} k
# @return {Integer}
def min_number_of_semesters(n, dependencies, k)
  @n, @k, @map, @into = n, k, [], {}
  dependencies.each do |u, v|
    @map[u] ||= []
    @map[u] << v
    @into[v] = @into[v].to_i + 1
  end

  @key = (1..n).inject(0) { |tmp, u| tmp ^= (1 << u) }
  @hash, = { @key => n }
  dfs(0, 0, [])
  @hash[@key]
end
