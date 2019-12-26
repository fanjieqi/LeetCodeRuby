DIGITS = {
  "2" => %w(a b c),
  "3" => %w(d e f),
  "4" => %w(g h i),
  "5" => %w(j k l),
  "6" => %w(m n o),
  "7" => %w(p q r s),
  "8" => %w(t u v),
  "9" => %w(w x y z)
}

def dfs(arr)
  return arr.first if arr.length == 1
  arr[0].map do |ele|
    dfs(arr[1..-1]).map do |tmp|
      ele + tmp
    end
  end.flatten
end

# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  return [] if digits.length == 0
  result = digits.split("").map do |digit|
    DIGITS[digit]
  end
  dfs(result)
end
