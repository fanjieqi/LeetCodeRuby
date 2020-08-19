MAX = 1 << 31
def dist(a, b)
  (a == '_' || b == '_') ? 0 : (a.to_i/6 - b.to_i/6).abs + (a.to_i%6 - b.to_i%6).abs
end

# @param {String} word
# @return {Integer}
def minimum_distance(word)
  @f1, @f2 = {"_,_" => 0}, {}
  word.each_char do |char|
    char = char.ord - 'A'.ord
    @f1.each do |key, value|
      a, b = key.split(",")
      @f2["#{char},#{b}"] = [@f2["#{char},#{b}"] || MAX, @f1["#{a},#{b}"] + dist(a, char)].min
      @f2["#{a},#{char}"] = [@f2["#{a},#{char}"] || MAX, @f1["#{a},#{b}"] + dist(b, char)].min
    end
    @f1, @f2 = @f2, {}
  end
  @f1.values.min
end
