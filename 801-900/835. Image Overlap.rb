# @param {Integer[][]} a
# @param {Integer[][]} b
# @return {Integer}
def largest_overlap(a, b)
  n, m = a.size, a[0].size
  a = a.map { |row| row.join.to_i(2) }
  b = b.map { |row| row.join.to_i(2) }
  max = 0

  n.times do |k|
    m.times do |l|
      sum1, sum2 = 0, 0
      n.times do |i|
        sum1 += ((a[i] >> l) & b[i+k]).to_s(2).count("1") if b[i+k]
        sum2 += ((b[i] >> l) & a[i+k]).to_s(2).count("1") if a[i+k]
      end
      max = sum1 if sum1 > max
      max = sum2 if sum2 > max
    end
  end
  max
end
