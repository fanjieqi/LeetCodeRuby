# @param {Integer[][]} books
# @param {Integer} shelf_width
# @return {Integer}
def min_height_shelves(books, shelf_width)
  widthes, heights = [0], [0]
  (0..books.size-1).each do |i| 
    widthes[i+1] = widthes[i] + books[i][0]
    heights[i+1] = heights[i] + books[i][1]
  end

  max = []
  (0..books.size-1).each do |i|
    (i..books.size-1).each do |j|
      break if widthes[j+1] - widthes[i] > shelf_width
      max[j] ||= {}
      max[j][i] = max.dig(j-1, i)
      max[j][i] = books[j][1] if i == j || max.dig(j-1, i) && books[j][1] > max[j-1][i]
    end
  end

  (0..books.size-1).each do |i|
    max[i].each do |j, height|
      tmp = (j > 0 ? heights[j].to_i : 0) + height
      heights[i+1] = tmp if tmp < heights[i+1]
    end
  end
  heights[-1]
end
