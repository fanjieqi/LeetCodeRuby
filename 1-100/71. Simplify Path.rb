# @param {String} path
# @return {String}
def simplify_path(path)
  result = path.split("/")
  result.delete_if(&:empty?)
  ans = []
  result.each do |ele|
    case ele
    when ".." then ans.pop
    when "." then next
    else ans << ele
    end
  end
  "/" + ans.join("/")
end
