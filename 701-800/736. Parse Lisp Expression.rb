# @param {String} expression
# @return {Integer}
def evaluate(expression)
  scopes, items = [{}], [["root"]]
  expression.gsub(")", " )").split.each do |item|
    tmp = item.clone
    if item[0] == "("
      items << [item[1..-1]]
      scopes << scopes[-1].clone if item[1..-1] == "let"
      next
    elsif item == ")"
      if items[-1][0] == "add"
        item = (items[-1][1].to_i + items[-1][-1].to_i).to_s
      elsif items[-1][0] == "mult"
        item = (items[-1][1].to_i * items[-1][-1].to_i).to_s
      else
        item = items[-1][-1]
        item = scopes[-1][item] if scopes[-1][item]
        scopes.pop
      end
      items.pop
    end
    item = scopes[-1][item] if scopes[-1][item] && (items[-1][0] != "let" || items[-1].length % 2 == 0)
    scopes[-1][items[-1][-1]] = item if items[-1][0] == "let" && item.gsub(/^-/, '')[/^\d+$/]
    items[-1] << item
  end
  items[-1][-1].to_i
end

# p evaluate("(let x 1 y 2 x (add x y) (add x y))")
# p evaluate("(let x 2 (add (let x 3 (let x 4 x)) x))")
p evaluate("(let a1 3 b2 (add a1 1) b2) ")