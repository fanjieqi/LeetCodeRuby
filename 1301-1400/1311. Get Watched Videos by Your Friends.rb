# @param {String[][]} watched_videos
# @param {Integer[][]} friends
# @param {Integer} id
# @param {Integer} level
# @return {String[]}
def watched_videos_by_friends(watched_videos, friends, id, level)
  levels = {id => 0}
  queue = Queue.new
  queue << id
  while !queue.empty?
    u = queue.pop
    next if friends[u].nil?
    friends[u].each do |v|
      next if levels[v]
      levels[v] = levels[u] + 1
      queue << v
    end
  end
  level_friends = levels.select { |u, l| l == level }.keys
  level_friends.map { |friend| watched_videos[friend] }.flatten.compact
              .group_by(&:itself).transform_values(&:count)
              .sort_by { |video, count| [count, video] }.map(&:first)
end
