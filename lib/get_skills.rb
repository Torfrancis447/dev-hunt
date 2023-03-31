require "uri"
require "net/http"

url = URI("https://api.apilayer.com/skills?q=react")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Get.new(url)
request['apikey'] = "MkHd5krNtj6D2MA1oYcXFQt1djhxYhS9"

response = https.request(request)
puts response.read_body