def get_father(i)
  (@father[i].nil? || @father[i] == i) ? i : @father[i] = get_father(@father[i])
end

# @param {String[]} equations
# @return {Boolean}
def equations_possible(equations)
  @father = {}
  equations.select { |equation| equation["=="] } .each do |equation|
    a, b = equation.scan(/\w/)
    @father[get_father(a)] = get_father(b)
  end
  equations.select { |equation| equation["!="] }.all? do |equation|
    a, b = equation.scan(/\w/)
    get_father(a) != get_father(b)
  end
end
