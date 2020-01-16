# @param {Integer[][]} people
# @return {Integer[][]}
def reconstruct_queue(people)
  people.sort_by{|h, k| [-h, k]}.inject([]) { |ans, (h, k)| ans.insert(k, [h,k])}
end
