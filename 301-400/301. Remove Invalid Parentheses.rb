def remove_invalid_parentheses(s)
  @results = []
  remove(s, 0, 0, ['(', ')'])
  @results
end

def remove(s, prev_i, prev_j, par)
  counter = 0
  (prev_i...s.length).each do |i|
    counter += 1 if s[i] == par[0]
    counter -= 1 if s[i] == par[1]
    next if counter >= 0
    (prev_j..i).each do |j|
      if s[j] == par[1] && (s[j-1] != par[1] || j == prev_j)
        remove(s[0...j] + s[(j+1)..-1], i, j, par)
      end
    end
    return
  end
  r_s = s.reverse
  if par[0] == '('
    remove(r_s, 0, 0, [')','('])
  else
    @results << r_s
  end
end
