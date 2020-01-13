MAX = 1 << 31
# @param {Integer[][]} rectangles
# @return {Boolean}
def is_rectangle_cover(rectangles)
  hash = {}
  a,b,c,d,area= MAX, MAX, -MAX, -MAX, 0
  rectangles.sort.each do |x1, y1, x2, y2|
    a, b = x1, y1 if x1<=a and y1<=b
    c, d = x2, y2 if x2>=c and y2>=d
    area += (x2-x1) * (y2-y1)
    hash[x1] ||= {}
    hash[x1][y1] ||= 0
    hash[x1][y1] += 1
    hash[x2] ||= {}
    hash[x2][y2] ||= 0
    hash[x2][y2] += 1
    hash[x1] ||= {}
    hash[x1][y2] ||= 0
    hash[x1][y2] += 1
    hash[x2] ||= {}
    hash[x2][y1] ||= 0
    hash[x2][y1] += 1
  end
  hash[a].delete(b) == 1 &&
  hash[c].delete(d) == 1 &&
  hash[a].delete(d) == 1 &&
  hash[c].delete(b) == 1 &&
  hash.values.map(&:values).flatten.all?(&:even?) &&
  area == (c-a) * (d-b)
end
