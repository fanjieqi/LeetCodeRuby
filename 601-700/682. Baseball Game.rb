# @param {String[]} ops
# @return {Integer}
def cal_points(ops)
  stack = []
  sum = 0
  ops.each do |ele|
    case ele
    when "C" then sum -= stack.pop
    when "D" then tmp = stack[-1] * 2; sum += tmp; stack << tmp
    when "+" then tmp = stack[-2] + stack[-1]; sum += tmp; stack << tmp
    else sum += ele.to_i; stack << ele.to_i
    end
  end
  sum
end
