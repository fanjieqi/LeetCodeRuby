# The guess API is already defined for you.
# @param num, your guess
# @return -1 if my number is lower, 1 if my number is higher, otherwise return 0
# def guess(num)

def guessNumber(n)
  l, r = 1, n
  while l < r
    mid = (l + r) / 2
    result = guess(mid)
    if result == 1
      l = mid+1
    elsif result == -1
      r = mid
    else
      return mid
    end
  end
  l
end
