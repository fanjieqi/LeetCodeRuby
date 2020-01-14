# @param {String[][]} equations
# @param {Float[]} values
# @param {String[][]} queries
# @return {Float[]}
def calc_equation(equations, values, queries)
  map = {}
  queue = Queue.new
  equations.each_with_index do |equation, i|
    j, k = equation
    map[j] ||= {}
    map[j][k] = values[i]
    map[k] ||= {}
    map[k][j] = 1/values[i] unless values[i].nil?
    queue << equation
    queue << equation.reverse unless values[i].nil?
  end

  while !queue.empty?
    ele1, ele2 = queue.pop
    next if map[ele1].nil? || map[ele1][ele2].nil? || map[ele1][ele2].zero?
    map[ele2].each do |ele3, v2|
      next if map[ele1][ele3]
      map[ele1][ele3] = map[ele1][ele2] * v2
      queue << [ele1, ele3]
    end
  end

  queries.map {|ele1, ele2| map[ele1].nil? || map[ele1][ele2].nil? || map[ele1][ele2].zero? ? -1.0 : map[ele1][ele2] }
end
