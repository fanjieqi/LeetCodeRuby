# @param {Integer[]} a
# @return {Integer}
def subarray_bitwise_o_rs(a)
  result, tmp = {}, {}
  a.each do |num1|
    result[num1] = true
    keys = tmp.keys
    tmp = {num1 => true}
    keys.each do |num2|
      tmp[num1 | num2] = true
      result[num1 | num2] = true
    end
  end
  result.size
end
