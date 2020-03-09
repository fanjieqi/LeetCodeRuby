# @param {String} senate
# @return {String}
def predict_party_victory(senate)
  queue_r, queue_d = [], []
  senate.size.times.each do |i|
    (senate[i] == "R" ? queue_r : queue_d) << i
  end

  i = senate.size
  while !queue_r.empty? && !queue_d.empty?
    (queue_r.shift < queue_d.shift ? queue_r : queue_d) << (i+=1)
  end

  queue_r.empty? ? "Dire" : "Radiant"
end
