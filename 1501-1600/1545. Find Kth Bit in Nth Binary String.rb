# @param {Integer} n
# @param {Integer} k
# @return {Character}
def find_kth_bit(n, k)
  flip = 0
  l = 2**n - 1
  while k > 1
    return (1 ^ flip).to_s if k == l / 2 + 1
    if k > l / 2
      k = l + 1 - k
      flip = 1 - flip
    end
    l /= 2
  end
  flip.to_s
end
