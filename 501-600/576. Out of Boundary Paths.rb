# @param {Integer} m
# @param {Integer} n
# @param {Integer} n
# @param {Integer} i
# @param {Integer} j
# @return {Integer}
def find_paths(m, n, k, i, j)
  f = []
  (1..k).each do |ki|
    f[ki-1] ||= []
    f[ki] ||= []
    (0..m-1).each do |mi|
      f[ki-1][mi-1] ||= [] if mi >= 1
      f[ki-1][mi] ||= []
      f[ki-1][mi+1] ||= []
      f[ki][mi] = []
      (0..n-1).each do |ni|
        f[ki][mi][ni] = (
            (mi == 0 ? 1 : f[ki-1][mi-1][ni].to_i) + 
            (mi == m-1 ? 1 : f[ki-1][mi+1][ni].to_i) + 
            (ni == 0 ? 1 : f[ki-1][mi][ni-1].to_i) + 
            (ni == n-1 ? 1 : f[ki-1][mi][ni+1].to_i)
          ) % 1000000007
      end
    end
  end
  f[k].nil? ? 0 : f[k][i][j]
end

# p find_paths(2, 2, 2, 0, 0)
# p find_paths(1, 3, 3, 0, 1)
p find_paths(10, 10, 0, 5, 5)
