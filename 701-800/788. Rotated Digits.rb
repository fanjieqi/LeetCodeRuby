MAP =[
  ['2', '@'],
  ['5', '%'],
  ['6', '^'],
  ['9', '('],
  ['@', '5'],
  ['%', '2'],
  ['^', '9'],
  ['(', '6']
]

# @param {Integer} n
# @return {Integer}
def rotated_digits(n)
  sum = 0
  (1..n).each do |i| 
    s = i.to_s; 
    next unless s[/^[0125689]+$/]
    MAP.each { |k,v| s.gsub!(k, v) }
    sum += 1 if s.to_i != i
  end
  sum
end
