def get_father(i)
  (@father[i].nil? || @father[i] == i) ? i : @father[i] = get_father(@father[i])
end

# @param {Integer[][]} stones
# @return {Integer}
def remove_stones(stones)
  @father = {}
  stones.each do |x, y|
    @father[get_father(x)] = get_father(~y)
  end
  stones.size - @father.keys.map(&method(:get_father)).uniq.size
end
