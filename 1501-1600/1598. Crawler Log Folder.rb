# @param {String[]} logs
# @return {Integer}
def min_operations(logs)
  stack = []
  logs.each do |log|
    case log
    when '../' then stack.pop
    when './' then stack.size
    else stack << log
    end
  end
  stack.size
end
