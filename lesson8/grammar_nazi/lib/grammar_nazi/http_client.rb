class HTTPClient
  def initialize
    require 'net/http'
  end

  def get(url, params)
    uri = URI(url)
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    res.body
  end
end
