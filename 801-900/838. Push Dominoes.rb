# @param {String} dominoes
# @return {String}
def push_dominoes(dominoes)
  hash = {}
  dominoes.each_char.with_index { |char, i| hash[i] = char }
  loop do
    flag = true
    tmp = {}
    hash.each do |i, char|
      next if i == 0 && char == "L"  || i == dominoes.size - 1 && char == "R"
      if char == "L"
        tmp[i-1] ||= ""
        tmp[i-1] += "L"
      elsif char == "R"
        tmp[i+1] ||= ""
        tmp[i+1] += "R"
      end
    end
    hash = {}
    tmp.each do |i, char|
      if char.size == 1 && dominoes[i] == "."
        dominoes[i] = char
        hash[i] = char
        flag = false
      end
    end
    break if flag
  end
  dominoes
end
