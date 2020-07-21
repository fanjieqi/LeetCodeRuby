# @param {Integer[][]} bookings
# @param {Integer} n
# @return {Integer[]}
def corp_flight_bookings(bookings, n)
  lefts = bookings.group_by(&:first).transform_values{ |values| values.inject({}) { |hash, (i,j,k)| hash.merge(j => hash[j].to_i + k) } }
  rights, ans = {}, []
  (1..n).each do |i|
    sub = rights.delete(i-1).to_i
    if lefts[i]
      current = 0
      lefts[i].each do |r, k|
        current += k
        rights[r] ||= 0
        rights[r]  += k
      end
      ans[i] = ans[i-1].to_i + current - sub
    else
      ans[i] = ans[i-1].to_i - sub
    end
  end
  ans[1..n]
end
