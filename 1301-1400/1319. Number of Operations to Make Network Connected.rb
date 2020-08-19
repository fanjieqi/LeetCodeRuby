def get_father(i)
  (@father[i].nil? || @father[i] == i) ? i : @father[i] = get_father(@father[i])
end

# @param {Integer} n
# @param {Integer[][]} connections
# @return {Integer}
def make_connected(n, connections)
  @father, count = {}, 0
  connections.each do |i, j|
    fi, fj = get_father(i), get_father(j)
    if fi == fj
      count += 1
    else
      @father[fi] = fj
    end
  end
  num = (0..n-1).map { |i| get_father(i) }.uniq.count
  num <= count + 1 ? num-1 : -1
end
