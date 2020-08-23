class TweetCounts
  def initialize()
    @hash = {}
  end


=begin
  :type tweet_name: String
  :type time: Integer
  :rtype: Void
=end
  def record_tweet(tweet_name, time)
    @hash[tweet_name] ||= []
    i = @hash[tweet_name].bsearch_index { |ele| ele >= time } || @hash[tweet_name].size
    @hash[tweet_name].insert(i, time)
  end

  FREQ = {
    "minute" => 60,
    "hour" => 3600,
    "day" => 86400
  }

=begin
  :type freq: String
  :type tweet_name: String
  :type start_time: Integer
  :type end_time: Integer
  :rtype: Integer[]
=end
  def get_tweet_counts_per_frequency(freq, tweet_name, start_time, end_time)
    s = @hash[tweet_name].bsearch_index { |ele| ele >= start_time }
    arr = (0..(end_time - start_time)/FREQ[freq]).map { 0 }
    return arr if s.nil?
    t = (@hash[tweet_name].bsearch_index { |ele| ele > end_time } || @hash[tweet_name].size) - 1
    return arr if s > t
    @hash[tweet_name][s..t].each do |time|
      tmp = (time - start_time) / FREQ[freq]
      arr[tmp] += 1
    end
    arr
  end


end

# Your TweetCounts object will be instantiated and called as such:
# obj = TweetCounts.new()
# obj.record_tweet(tweet_name, time)
# param_2 = obj.get_tweet_counts_per_frequency(freq, tweet_name, start_time, end_time)
