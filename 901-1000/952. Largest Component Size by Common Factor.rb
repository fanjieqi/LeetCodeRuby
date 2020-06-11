require 'prime'
PRIMES = Prime.first(66)

def get_father(i)
  (@father[i].nil? || @father[i] == i) ? i : @father[i] = get_father(@father[i])
end

# @param {Integer[]} a
# @return {Integer}
def largest_component_size(a)
  @father = {}
  a.each do |num|
    tmp = num
    PRIMES.each do |prime|
      break if prime > tmp
      if tmp % prime == 0
        @father[get_father(num)] = get_father(prime)
        tmp /= prime while tmp % prime == 0
      end
    end
    @father[get_father(num)] = get_father(tmp) if tmp > 1
  end
  a.map(&method(:get_father)).group_by(&:itself).values.map(&:count).max
end
