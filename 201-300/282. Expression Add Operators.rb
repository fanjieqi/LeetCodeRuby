# @param {String} num
# @param {Integer} target
# @return {String[]}
def add_operators(num, target)
  @ans = []
  @num = num
  @target = target
  add_forward("", nil, nil, 0)
  @ans
end

def add_forward(str, val, mult, counter)
  # puts "counter: #{counter}, str: #{str}, #{eval(str)}"
  if counter == @num.length && val == @target
    @ans << str
    return
  end
  size = @num[counter] == "0" ? counter + 1 : @num.length
  (counter+1..size).each do |i|
    tmp = @num[counter..i-1].to_i
    if str == ""
      add_forward(tmp.to_s, tmp, tmp, i)
      next
    end

    add_forward(str+"+"+tmp.to_s, val+tmp, tmp, i)
    add_forward(str+"-"+tmp.to_s, val-tmp, -tmp, i)
    add_forward(str+"*"+tmp.to_s, (val-mult)+(mult*tmp), (mult*tmp), i)
  end
end
