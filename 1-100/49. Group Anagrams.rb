# @param {String[]} strs
# @return {String[][]}
def group_anagrams(strs)
  strs.group_by { |ele| ele.split("").sort.join("") }.values
end
