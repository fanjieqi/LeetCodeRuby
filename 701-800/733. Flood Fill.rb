AROUND = [
  [ 1,  0],
  [ 0,  1],
  [-1,  0],
  [ 0, -1],
]

def dfs(x, y, color)
  @image[x][y] = @color
  AROUND.each do |i, j|
    x1, y1 = x+i, y+j
    next if x1<0 || x1>=@m || y1<0 || y1>=@n
    dfs(x1, y1, color) if @image[x1][y1] == color && @image[x1][y1] != @color
  end
end

# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} new_color
# @return {Integer[][]}
def flood_fill(image, sr, sc, new_color)
  @image, @color = image, new_color
  @m, @n = @image.size, @image[0].size
  dfs(sr, sc, @image[sr][sc])
  @image
end
