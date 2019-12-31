require 'bigdecimal'

def get_row_max(points)
  row = {}
  points.each do |x, y|
    row[x] ||= 0
    row[x] += 1
  end
  row.values.max || 0
end

PRECISION = 0.00000001
# @param {Integer[][]} points
# @return {Integer}
def max_points(points)
  return 0 if points.length == 0
  return 1 if points.length == 1
  points = points.map { |x, y| [BigDecimal(x), BigDecimal(y)] }
  lines = {}
  (0..points.length-2).each do |i|
    x1, y1 = points[i]
    (i+1..points.length-1).each do |j|
      x2, y2 = points[j]
      next if x2 == x1

      k = (y2-y1) / (x2-x1)
      lines[k] ||= {}
      b = y1 - x1 * k
      lines[k][b] ||= []
      lines[k][b] << i
      lines[k][b] << j
    end
  end
  max = get_row_max(points)
  lines.each do |k, row|
    row.each do |b1, arr1|
      row.each do |b2, arr2|
        arr1 += arr2 if b2 != b1 && (arr1 & arr2).length > 1
      end
      max = [max, arr1.uniq.count].max
    end
  end
  max
end
