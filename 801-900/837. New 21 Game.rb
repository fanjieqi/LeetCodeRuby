# @param {Integer} n
# @param {Integer} k
# @param {Integer} w
# @return {Float}
def new21_game(n, k, w)
  return 1 if (k == 0 || n >= k + w)
  result, sum, f = 0, 1, [1]
  (1..n).each do |i|
    f[i] = sum / w.to_f
    if (i < k)
      sum += f[i]
    else
      result += f[i]
    end
    sum -= f[i - w] if (i - w >= 0)
  end
  result
end
