# @param {Integer[]} balls
# @return {Float}
def get_probability(balls)
  n = balls.sum
  total = (1..n).to_a.combination(n / 2).size
      
  status = {}
  status["0,0,0,0"] = 1 
  balls.each do |ball|
    combinations = (0..ball).map { |i| [i, (1..ball).to_a.combination(i).size] }.to_h
    tmp = {}
    status.each do |k, basic|
      a, b, ca, cb = k.split(",").map(&:to_i)
      combinations.each do |n_a, count|
        if n_a == 0
          key = "#{a},#{b+ball},#{ca},#{cb+1}"
          tmp[key] = tmp[key].to_i + basic * count
        elsif n_a == ball
          key = "#{a+ball},#{b},#{ca+1},#{cb}"
          tmp[key] = tmp[key].to_i + basic * count
        else
          key = "#{a+n_a},#{b+ball-n_a},#{ca},#{cb}"
          tmp[key] = tmp[key].to_i + basic * count
        end
      end
    end
    status = tmp
  end

  count = 0
  status.each do |k, basic|
    a, b, ca, cb = k.split(",").map(&:to_i)
    count += basic if a==b && ca==cb
  end
  count / total.to_f
end
