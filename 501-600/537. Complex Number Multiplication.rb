# @param {String} a
# @param {String} b
# @return {String}
def complex_number_multiply(a, b)
  (a.gsub("+-", "-").to_c * b.gsub("+-", "-").to_c).to_s.gsub(/(?!^)-/, "+-")
end
