# @param {String[]} names
# @return {String[]}
def get_folder_names(names)
  @hash = {}
  names.map do |name|
    num = @hash[name]
    if num.nil?
      @hash[name] = 0
      name
    else
      num += 1
      num += 1 while @hash["#{name}(#{num})"]
      @hash[name] = num
      tmp = "#{name}(#{num})"
      @hash[tmp] = 0
      tmp
    end
  end
end
