# @param {String[]} emails
# @return {Integer}
def num_unique_emails(emails)
  emails.map! do |email|
    left, right = email.split('@')
    left.gsub(/([\.]|(\+.+))/, '') + '@' + right
  end.uniq.size
end
