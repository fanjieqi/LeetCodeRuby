# @param {Integer} poured
# @param {Integer} query_row
# @param {Integer} query_glass
# @return {Float}
def champagne_tower(poured, query_row, query_glass)
  f = [poured]
  (1..query_row).each do |row|
    (row).downto(0) do |i|
      f[i] = [0, (f[i].to_f-1)/2.0].max
      f[i+1] ||= 0
      f[i+1] += f[i]
    end
  end
  [f[query_glass], 1].min
end
