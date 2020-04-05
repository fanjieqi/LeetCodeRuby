class Counter < Hash
  def initialize(other = {})
    super(0)
    other.each { |k, v| self[k] = v }
  end

  def +(tmp)
    result = Counter.new(self)
    tmp.each { |k, v| result[k] ||= 0; result[k] += v }
    result.delete_if { |k, v| v.zero? }
    result
  end

  def -(tmp)
    result = Counter.new(self)
    tmp.each { |k, v| result[k] ||= 0; result[k] -= v }
    result.delete_if { |k, v| v.zero? }
    result
  end

  def *(tmp)
    product = Counter.new
    self.each do |k1, v1|
      tmp.each do |k2, v2|
        k = (k1 + k2).sort
        product[k] ||= 0
        product[k] += v1 * v2
      end
    end
    product.delete_if { |k, v| v.zero? }
    product
 end
end

def f(s)
  s = @hash[s] || s
  s.to_s[/^\-{0,1}\d+$/] ? Counter.new([] => s.to_i) : Counter.new([s] => 1)
end

# @param {String} expression
# @param {String[]} evalvars
# @param {Integer[]} evalints
# @return {String[]}
def basic_calculator_iv(expression, evalvars, evalints)
  @hash = evalvars.zip(evalints).to_h
  expression = expression.gsub(/(\w+)/, 'f("\1")')
  result = eval(expression)
  result.delete_if { |k, v| v.zero? }
  result.sort_by{|k, v| [-k.size, k]}.map { |k, v| v.to_s + (k.empty? ? "" : "*"+k.join("*")) }
end
