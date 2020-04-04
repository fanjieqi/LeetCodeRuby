# @param {String} bottom
# @param {String[]} allowed
# @return {Boolean}
def pyramid_transition(bottom, allowed)
  map = {}
  allowed.each do |ele|
    p1, p2, p3 = ele.split("")
    map[p1] ||= {}
    map[p1][p2] ||= []
    map[p1][p2] << p3
  end

  row = [bottom.split("").map{|char| [char]}]
  (1..row[0].size-1).each do |i|
    row[i] ||= []
    (0..row[i-1].size-2).each do |j|
      row[i][j] ||= []
      row[i-1][j].each do |p1|
        row[i-1][j+1].each do |p2|
          row[i][j] += map[p1][p2] if map[p1] && map[p1][p2]
        end
      end
      row[i][j].uniq!
      return false if row[i][j].empty?
    end
  end
  true
end
