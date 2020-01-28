# @param {Integer[]} houses
# @param {Integer[]} heaters
# @return {Integer}
def find_radius(houses, heaters)
  houses.sort!.uniq!
  heaters.sort!.uniq!
  min = 0
  houses.each do |house|
    i = heaters.bsearch_index{|heater| heater >= house}
    if i.nil?
      min = [min, (heaters.last-house).abs].max
    elsif i.zero?
      min = [min, (heaters[i]-house).abs].max
    else
      min = [min, [(heaters[i-1]-house).abs, (heaters[i]-house).abs].min].max
    end
  end
  min
end
