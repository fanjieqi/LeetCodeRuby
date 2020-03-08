# @param {String} equation
# @return {String}
def solve_equation(equation)
  left, right = equation.split("=")
  left_nums = left.split(/[\+\-]/)
  left_ops = left.scan(/[\+\-]/)
  left[/^\-/] ? left_nums.shift : left_ops.unshift("+")  

  right_nums = right.split(/[\+\-]/)
  right_ops = right.scan(/[\+\-]/)
  right[/^\-/] ? right_nums.shift : right_ops.unshift("+")

  left = 0
  right = 0
  left_nums.each_with_index do |num, i|
    op = left_ops[i] == "+" ? 1 : -1
    if num == "x"
      left += op
    elsif num[/x/]
      left += op * num[/^\d+/].to_i
    else
      right -= op * num[/^\d+/].to_i
    end
  end

  right_nums.each_with_index do |num, i|
    op = right_ops[i] == "+" ? 1 : -1
    if num == "x"
      left -= op
    elsif num[/x/]
      left -= op * num[/^\d+/].to_i
    else
      right += op * num[/^\d+/].to_i
    end
  end

  left.zero? ? (right.zero? ? "Infinite solutions" : "No solution") : "x=#{right / left}"
end
