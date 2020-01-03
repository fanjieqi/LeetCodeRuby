NUMBERS = {
  1_000_000_000 => "Billion",
  1_000_000 => "Million",
  1000 => "Thousand",
  100 => "Hundred",
  90 => "Ninety",
  80 => "Eighty",
  70 => "Seventy",
  60 => "Sixty",
  50 => "Fifty",
  40 => "Forty",
  30 => "Thirty",
  20 => "Twenty",
  19 => "Nineteen",
  18 => "Eighteen",
  17 => "Seventeen", 
  16 => "Sixteen",
  15 => "Fifteen",
  14 => "Fourteen",
  13 => "Thirteen",              
  12 => "Twelve",
  11 => "Eleven",
  10 => "Ten",
  9 => "Nine",
  8 => "Eight",
  7 => "Seven",
  6 => "Six",
  5 => "Five",
  4 => "Four",
  3 => "Three",
  2 => "Two",
  1 => "One"
}

def process(num)
  str = ""
  NUMBERS.each do |tmp, name|
    if num == 0
      return str
    elsif num.to_s.length == 1 && num/tmp > 0
      return str + "#{name}"      
    elsif num < 100 && num/tmp > 0
      return str + "#{name}" if num%tmp == 0
      return str + "#{name} " + process(num%tmp)
    elsif num/tmp > 0
      return str + process(num/tmp) + " #{name} " + process(num%tmp)
    end
  end
end

# @param {Integer} num
# @return {String}
def number_to_words(num)
  return "Zero" if num == 0
  process(num).strip.gsub(/\s+/, " ")
end
