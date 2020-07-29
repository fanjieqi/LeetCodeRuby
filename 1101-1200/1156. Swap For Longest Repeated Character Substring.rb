# @param {String} text
# @return {Integer}
def max_rep_opt1(text)
  array = []
  text.chars.each_with_index do |char, i|
    if char == array.dig(-1, 0)
      array[-1][1] +=1 
    else
      array << [char, 1]
    end
  end

  count = text.chars.group_by(&:itself).transform_values(&:count)

  ans = array.map { |char, k| [k+1, count[char]].min }.max

  (1..array.size-2).each do |i|
    if array[i-1][0] == array[i+1][0] && array[i][1] == 1
      tmp = [array[i-1][1] + array[i+1][1] + 1, count[array[i+1][0]]].min
      ans = tmp if tmp > ans
    end
  end
  ans
end
