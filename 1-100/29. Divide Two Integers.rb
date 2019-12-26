# @param {Integer} dividend
# @param {Integer} divisor
# @return {Integer}
def divide(dividend, divisor)
  sign = (dividend < 0) ^ (divisor < 0) ? -1 : 1
  dividend, divisor, quotient = dividend.abs, divisor.abs, 0

  while dividend >= divisor
      temp, i = divisor, 1

      while dividend >= temp
          dividend -= temp
          quotient += i

          i <<= 1
          temp <<= 1
      end
  end
  [[-2147483648, sign * quotient].max, 2147483647].min
end
