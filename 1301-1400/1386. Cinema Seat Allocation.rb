# @param {Integer} n
# @param {Integer[][]} reserved_seats
# @return {Integer}
def max_number_of_families(n, reserved_seats)
  hash = {}
  reserved_seats.each do |r, c|
    hash[r] ||= {}
    hash[r][c] = true
  end
  count = 0
  hash.each do |i, row|
    if row[2].nil? && row[3].nil? && row[4].nil? && row[5].nil? && row[6].nil? && row[7].nil? && row[8].nil? && row[9].nil?
      count += 2
    elsif row[2].nil? && row[3].nil? && row[4].nil? && row[5].nil? || row[4].nil? && row[5].nil? && row[6].nil? && row[7].nil? || row[6].nil? && row[7].nil? && row[8].nil? && row[9].nil?
      count += 1 
    end
  end
  (n - hash.size) * 2 + count
end
