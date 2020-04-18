# @param {String[]} cpdomains
# @return {String[]}
def subdomain_visits(cpdomains)
  hash = {}
  cpdomains.each do |cpdomain|
    count, domain = cpdomain.split(" ")
    i = -1
    while i
      i+=1
      hash[domain[i..-1]] ||=0
      hash[domain[i..-1]] += count.to_i
      i = domain.index(".", i)
    end
  end
  hash.map{ |domain, count| "#{count} #{domain}" }
end
