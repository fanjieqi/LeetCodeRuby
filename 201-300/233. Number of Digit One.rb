# @param {Integer} n
# @return {Integer}
def count_digit_one(n)
  ans = 0
  div = 1
  while div <=n 
    a = n / div
    b = a % 10
    a /= 10
    c = n % div
    if b > 1
      ans += (a+1)*div
    elsif b == 1
      ans += a*div + c+1
    else
      ans += a*div
    end
    div *= 10
  end
  ans
end
