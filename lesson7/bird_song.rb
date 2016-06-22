require 'active_support/all'

class HTTPClient

  def get(url, params)
    res = Net::HTTP.get_response(URI(url + params))
    res.body
  end

  private

  def initialize
    require 'net/http'
  end

end

class DataStore

  def save(data)
    data = JSON.parse(data).to_yaml
    File.new('lesson7/bird_songs/song.yml', 'w').write(data)
  end

  private

  def initialize
    require 'yaml'
  end

end

class BirdSong

  # NOTE: пример окончательной строки запроса: http://www.xeno-canto.org/api/2/recordings?query=nightingale+cnt:russia+q:A
  URL = 'http://www.xeno-canto.org/api/2/recordings'

  def fetch(bird:, country:, quality: :A)
    query = get_query(bird, country, quality)
    song = @client.get(URL, query)
    @store.save(song)
  end

  private

  def initialize client:, store:
    @client = client
    @store  = store
  end

  def get_query bird, country, quality = 'A'
    "?query=#{bird}+cnt:#{country}+q:#{quality}"
  end

end


bird_song = BirdSong.new(client: HTTPClient.new, store: DataStore.new)
bird_song.fetch(bird: :nightingale, country: :russia)
