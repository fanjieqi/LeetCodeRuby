def get_father(email)
  (@father[email].nil? || @father[email] == email) ? email : @father[email] = get_father(@father[email])
end

# @param {String[][]} accounts
# @return {String[][]}
def accounts_merge(accounts)
  names = accounts.map.with_index { |account, i| [i, account[0]] }.to_h
  @father = {}
  index = {}
  accounts.each_with_index do |account, i|
    @father[account[1]] ||= get_father(account[1])
    account[1..-1].each do |email|
      index[email] ||= i
      @father[get_father(email)] = get_father(account[1])
    end
  end
  @father.group_by{|email, father| get_father(father) }.map{|father, emails| [names[index[father]]]+ emails.flatten.uniq.sort }
end
