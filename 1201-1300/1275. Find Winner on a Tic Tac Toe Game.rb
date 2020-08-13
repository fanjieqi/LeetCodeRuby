# @param {Integer[][]} moves
# @return {String}
def tictactoe(moves)
  row, col, diag1, diag2 = {}, {}, {}, {}
  moves.each_with_index do |(x, y), i|
    row[x] = row[x].to_i + (i.even? ? 1 : -1)
    col[y] = col[y].to_i + (i.even? ? 1 : -1)
    diag1[x+y] = diag1[x+y].to_i + (i.even? ? 1 : -1)
    diag2[x-y] = diag2[x-y].to_i + (i.even? ? 1 : -1)

    return 'A' if row[x] == 3 || col[y] == 3 || diag1[x+y] == 3 || diag2[x-y] == 3
    return 'B' if row[x] == -3 || col[y] == -3 || diag1[x+y] == -3 || diag2[x-y] == -3
  end
  moves.size == 9 ? 'Draw' : 'Pending'
end
