# @param {String[]} logs
# @return {String[]}
def reorder_log_files(logs)
  lexicos = logs.select { |log| log.split(" ", 2).last[/[a-z]/] }
  lexicos.sort_by { |log| log.split(" ", 2).reverse.join } + logs.delete_if { |log| log.split(" ", 2).last[/[a-z]/] }
end
