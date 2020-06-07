# @param {Integer} n
# @return {Integer}
def knight_dialer(n)
  x1, x2, x3, x4, x5, x6, x7, x8, x9, x0 = 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  (n-1).times do
      x1, x2, x3, x4, x5, x6, x7, x8, x9, x0 = \
        x6 + x8, x7 + x9, x4 + x8, \
        x3 + x9 + x0, 0, x1 + x7 + x0, \
        x2 + x6, x1 + x3, x2 + x4, \
        x4 + x6
  end
   (x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x0) % (10**9 + 7)
end
