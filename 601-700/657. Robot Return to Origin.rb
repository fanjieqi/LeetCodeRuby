# @param {String} moves
# @return {Boolean}
def judge_circle(moves)
  r = moves.scan("R").size
  l = moves.scan("L").size
  u = moves.scan("U").size
  d = moves.scan("D").size
  r == l && u == d
end
