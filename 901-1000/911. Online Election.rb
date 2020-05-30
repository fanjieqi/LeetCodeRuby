class TopVotedCandidate

=begin
    :type persons: Integer[]
    :type times: Integer[]
=end
    def initialize(persons, times)
      @times = times
      @array, @count, @ans = [], {}, []
      persons.each_with_index do |person, i|
        @count[person] ||= 0
        @count[person]  += 1
        @array.delete(person)
        index = @array.bsearch_index { |ele| @count[ele] > @count[person] }
        @array.insert(index || -1, person)
        @ans << @array.last
      end
    end


=begin
    :type t: Integer
    :rtype: Integer
=end
    def q(t)
      i = @times.bsearch_index { |time| time >= t }
      i.nil? ? @ans[-1] : (@times[i] == t ? @ans[i] : @ans[i-1])
    end


end

# Your TopVotedCandidate object will be instantiated and called as such:
# obj = TopVotedCandidate.new(persons, times)
# param_1 = obj.q(t)
