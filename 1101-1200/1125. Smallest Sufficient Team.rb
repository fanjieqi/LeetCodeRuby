# @param {String[]} req_skills
# @param {String[][]} people
# @return {Integer[]}
def smallest_sufficient_team(req_skills, people)
  @skills = req_skills.map.with_index { |skill, i| [skill, i] }.to_h
  @target = ('1' * req_skills.size).to_i(2)

  @people = []
  people.each_with_index do |skills, i|
    @people[i] = skills.inject(0) {|tmp, skill| tmp |= (1 << @skills[skill]) }
  end

  @rest = []
  (people.size-1).downto(0) do |i|
    @rest[i] = @people[i]
    @rest[i] |= @rest[i+1] if i < people.size-1
  end

  ans = people
  queue = Queue.new
  @people.each_with_index { |cur, i| queue << [cur, [i]] }
  while !queue.empty?
    cur, arr = queue.pop
    next if arr.size >= ans.size
    (people.size-1).downto(arr[-1]+1) do |j|
      next if @people[j].zero?
      worse = cur | @rest[j]
      next if worse != @target
      res = cur | @people[j]
      tmp = arr + [j]
      if res == @target
        ans = tmp if arr.size < ans.size-1
      else
        queue << [res, tmp]
      end
    end
  end
  ans
end
