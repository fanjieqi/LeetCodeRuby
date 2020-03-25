# @param {String[]} source
# @return {String[]}
def remove_comments(source)
  source.join("\n").gsub(%r(//.*|/\*(.|\n)*?\*/), '').split("\n").reject(&:empty?)
end
