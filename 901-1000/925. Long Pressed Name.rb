# @param {String} name
# @param {String} typed
# @return {Boolean}
def is_long_pressed_name(name, typed)
  # name.split(/(?=\w)(?<!\1)/)
  a1, a2 = [], []
  name.each_char do |c|
    if a1.empty? || c != a1.dig(-1, 0)
      a1 << [c, 1]
    else
      a1[-1][1] += 1
    end
  end
  typed.each_char do |c|
    if a2.empty? || c != a2.dig(-1, 0)
      a2 << [c, 1]
    else
      a2[-1][1] += 1
    end
  end
  a1.size == a2.size && (0..a1.size-1).all? { |i| a1[i][0] == a2[i][0] && a1[i][1] <= a2[i][1] }
end
