# @param {Integer} radius
# @param {Integer} x_center
# @param {Integer} y_center
# @param {Integer} x1
# @param {Integer} y1
# @param {Integer} x2
# @param {Integer} y2
# @return {Boolean}
def check_overlap(radius, x_center, y_center, x1, y1, x2, y2)
  x1 <= x_center && x_center <= x2 && y1 <= y_center && y_center <= y2 || \
  ((x_center-x1).abs <= radius || (x_center-x2).abs <= radius) && y1 <= y_center && y_center <= y2 || \
  ((y_center-y1).abs <= radius || (y_center-y2).abs <= radius) && x1 <= x_center && x_center <= x2 || \
  x_center!=x1 && y_center!=y1 && (x_center-x1).abs**2 + (y_center-y1).abs**2 <= radius * radius || \
  x_center!=x1 && y_center!=y2 && (x_center-x1).abs**2 + (y_center-y2).abs**2 <= radius * radius || \
  x_center!=x2 && y_center!=y1 && (x_center-x2).abs**2 + (y_center-y1).abs**2 <= radius * radius || \
  x_center!=x2 && y_center!=y2 && (x_center-x2).abs**2 + (y_center-y2).abs**2 <= radius * radius || \
  x_center==x1 && ((y_center-y1).abs <= radius || (y_center-y2).abs <= radius) || \
  x_center==x2 && ((y_center-y1).abs <= radius || (y_center-y2).abs <= radius) || \
  y_center==y1 && ((x_center-x1).abs <= radius || (x_center-x2).abs <= radius) || \
  y_center==y2 && ((x_center-x1).abs <= radius || (x_center-x2).abs <= radius)
end
