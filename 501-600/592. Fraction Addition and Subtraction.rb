# @param {String} expression
# @return {String}
def fraction_addition(expression)
  operations = expression.scan(/(?!^)[+-]/)
  numbers = expression.split(/(?!^)[+-]/)
  current = numbers.shift
  numbers.each_with_index do |number, i|
    c_numerator, c_denominator = current.split("/").map(&:to_i)
    t_numerator, t_denominator = number.split("/").map(&:to_i)
    denominator = c_denominator.lcm(t_denominator)

    c_numerator *= (denominator / c_denominator)
    t_numerator *= (denominator / t_denominator)
    numerator = eval("#{c_numerator}#{operations[i]}#{t_numerator}")

    gcd = numerator.gcd(denominator)
    denominator /= gcd
    numerator /= gcd
    current = "#{numerator}/#{denominator}"
  end
  current
end
