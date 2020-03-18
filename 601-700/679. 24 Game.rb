# @param {Integer[]} nums
# @return {Boolean}
def judge_point24(nums)
  nums.map!(&:to_f)
  nums.permutation(4).to_a.any? do |arr|
    %w(+ - * /).repeated_permutation(3).any? do |op|
      expressions = [
        "#{arr[0]} #{op[0]} #{arr[1]} #{op[1]} #{arr[2]} #{op[2]} #{arr[3]}",
        "(#{arr[0]} #{op[0]} #{arr[1]}) #{op[1]} (#{arr[2]} #{op[2]} #{arr[3]})",
        "(#{arr[0]} #{op[0]} #{arr[1]} #{op[1]} #{arr[2]}) #{op[2]} #{arr[3]}",
        "((#{arr[0]} #{op[0]} #{arr[1]}) #{op[1]} #{arr[2]}) #{op[2]} #{arr[3]}",
        "(#{arr[0]} #{op[0]} (#{arr[1]} #{op[1]} #{arr[2]})) #{op[2]} #{arr[3]}",
        "#{arr[0]} #{op[0]} (#{arr[1]} #{op[1]} #{arr[2]} #{op[2]} #{arr[3]})",
        "#{arr[0]} #{op[0]} ((#{arr[1]} #{op[1]} #{arr[2]}) #{op[2]} #{arr[3]})",
        "#{arr[0]} #{op[0]} (#{arr[1]} #{op[1]} (#{arr[2]} #{op[2]} #{arr[3]}))",
      ]
      begin expressions.any? { |expr| (eval(expr) - 24).abs <= 0.00000001 } rescue false end
    end
  end
end
