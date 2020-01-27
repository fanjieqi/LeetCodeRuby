require 'resolv'

# @param {String} ip
# @return {String}
def valid_ip_address(ip)
  return "Neither" if ip[/\:{2,}/]
  case ip
  when Resolv::IPv4::Regex
    "IPv4"
  when Resolv::IPv6::Regex
    "IPv6"
  else
    "Neither"
  end
end
