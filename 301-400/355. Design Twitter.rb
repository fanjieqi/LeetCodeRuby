class Twitter

=begin
    Initialize your data structure here.
=end
    def initialize()
      @followees = {}
      @tweets = {}
      @count = 0
    end


=begin
    Compose a new tweet.
    :type user_id: Integer
    :type tweet_id: Integer
    :rtype: Void
=end
    def post_tweet(user_id, tweet_id)
      @tweets[user_id] ||= []
      @tweets[user_id].unshift([@count += 1, tweet_id])
      @tweets[user_id] = @tweets[user_id][0..9]
      nil
    end


=begin
    Retrieve the 10 most recent tweet ids in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user herself. Tweets must be ordered from most recent to least recent.
    :type user_id: Integer
    :rtype: Integer[]
=end
    def get_news_feed(user_id)
      @followees[user_id] ||= {}
      feeds = @followees[user_id].empty? ? [] :
              @followees[user_id].keys.inject([]) { |arr, followee_id|
                arr += @tweets[followee_id] || []
              }
      feeds += @tweets[user_id] if @tweets[user_id]
      feeds.sort_by(&:first).uniq.reverse[0..9].map(&:last)
    end


=begin
    Follower follows a followee. If the operation is invalid, it should be a no-op.
    :type follower_id: Integer
    :type followee_id: Integer
    :rtype: Void
=end
    def follow(follower_id, followee_id)
      @followees[follower_id] ||= {}
      @followees[follower_id][followee_id] = true
      nil
    end


=begin
    Follower unfollows a followee. If the operation is invalid, it should be a no-op.
    :type follower_id: Integer
    :type followee_id: Integer
    :rtype: Void
=end
    def unfollow(follower_id, followee_id)
      @followees[follower_id] ||= {}
      @followees[follower_id].delete(followee_id)
      nil
    end


end

# Your Twitter object will be instantiated and called as such:
# obj = Twitter.new()
# obj.post_tweet(user_id, tweet_id)
# param_2 = obj.get_news_feed(user_id)
# obj.follow(follower_id, followee_id)
# obj.unfollow(follower_id, followee_id)
