@hash = {}
BASE = "http://tinyurl.com/"
# Encodes a URL to a shortened URL.
#
# @param {string} longUrl
# @return {string}
def encode(longUrl)
  @hash[longUrl.hash] = longUrl
  BASE + longUrl.hash.to_s
end

# Decodes a shortened URL to its original URL.
#
# @param {string} shortUrl
# @return {string}
def decode(shortUrl)
  @hash[shortUrl.gsub(BASE, "").to_i]
end


# Your functions will be called as such:
# decode(encode(url))
