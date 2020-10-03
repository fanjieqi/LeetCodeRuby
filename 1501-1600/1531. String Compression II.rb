MAX = 1 <<31

def calcLen(len)
  if len == 0
    0
  elsif len == 1
    1
  elsif len < 10
    2
  elsif len < 100
    3
  else
    4
  end
end

# @param {String} s
# @param {Integer} k
# @return {Integer}
def get_length_of_optimal_compression(s, k)
  n, f = s.length, []
  (1..n).each do |i|
    f[i] ||= []
    (0..k).each do |j|
      f[i][j] = f.dig(i-1, j-1).to_i if j > 0
      removed, count = 0, 0
      (i).downto(1) do |l|
        if s[l-1] == s[i-1]
          count += 1
        else
          removed += 1
          break if removed > j
        end
        tmp = f.dig(l-1, j-removed).to_i + calcLen(count)
        f[i][j] = tmp if f[i][j].nil? || tmp < f[i][j]
      end
    end
  end
  f[n][k]
end
