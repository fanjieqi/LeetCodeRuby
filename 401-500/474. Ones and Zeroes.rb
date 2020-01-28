# @param {String[]} strs
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def find_max_form(strs, m, n)
  counts = strs.sort_by(&:length).map { |str|  [str.scan("0").count, str.scan("1").count] }

  f = []
  counts.each do |c0, c1|
    m.downto(0) do |i|
    f[i] ||= []
      n.downto(0) do |j|
        next if i < c0 || j < c1
        f[i-c0] ||= []
        f[i][j] = [ f[i][j].to_i, f[i-c0][j-c1].to_i+1 ].max
      end
    end
  end

  f[m][n].to_i
end
