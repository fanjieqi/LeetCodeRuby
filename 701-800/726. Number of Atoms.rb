# @param {String} formula
# @return {String}
def count_of_atoms(formula)
  while formula[/\([^\(\)]+\)\d{0,}/]
    hash = {}
    sub_formula = formula[/\([^\(\)]+\)\d{0,}/]
    cardinality = [sub_formula[/\d{0,}$/].to_i, 1].max

    sub_formula.gsub(/\d{0,}$/, "").scan(/[[:upper:]][[:lower:]]{0,}\d{0,}/).each do |tmp|
      count = [tmp[/\d{0,}$/].to_i, 1].max
      atom = tmp[/[[:upper:]][[:lower:]]{0,}/]
      hash[atom] ||= 0
      hash[atom] += count * cardinality
    end
    formula.gsub!(sub_formula, hash.sort.map(&:join).join)
  end
  hash = {}
  formula.scan(/[[:upper:]][[:lower:]]{0,}\d{0,}/).each do |tmp|
    count = [tmp[/\d{0,}$/].to_i, 1].max
    atom = tmp[/[[:upper:]][[:lower:]]{0,}/]
    hash[atom] ||= 0
    hash[atom] += count
  end
  hash.sort.map { |atom, count| atom + (count == 1 ? "" : count).to_s }.join
end
