# @param {Integer[]} pushed
# @param {Integer[]} popped
# @return {Boolean}
def validate_stack_sequences(pushed, popped)
  stack = []
  popped.each_with_index do |pop, i|
    stack << pushed.shift while stack[-1] != pop && !pushed.empty?
    return false if stack[-1] != pop
    stack.pop
  end
  stack.empty?
end
