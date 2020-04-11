# @param {Integer[][]} ghosts
# @param {Integer[]} target
# @return {Boolean}
def escape_ghosts(ghosts, target)
  dis = target[0].abs + target[1].abs
  ghosts.all? { |ghost| ((ghost[0]-target[0]).abs + (ghost[1]-target[1]).abs) > dis }
end
