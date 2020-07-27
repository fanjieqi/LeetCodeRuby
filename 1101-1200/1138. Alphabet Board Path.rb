BOARD = ["abcde", "fghij", "klmno", "pqrst", "uvwxy", "z"]

# @param {String} target
# @return {String}
def alphabet_board_path(target)
  r, c, ans = 0, 0, ""
  target.each_char do |char|
    i = char.ord - 'a'.ord
    tr, tc = i / 5, i % 5
    ans += 'L' * (c-tc) if c > tc
    ans += 'U' * (r-tr) if r > tr
    ans += 'D' * (tr-r) if tr > r
    ans += 'R' * (tc-c) if tc > c
    ans += "!"
    r, c = tr, tc
  end
  ans
end
