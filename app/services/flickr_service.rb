class FlickrService
  def initialize(lat, long)
    @lat  = lat
    @long = long
    @conn = Faraday.new('https://api.flickr.com/services')
  end

  def photos_search
    get_json("rest/?method=flickr.photos.search&api_key=#{ENV['FLICKR_KEY']}&accuracy=8&per_page=500&has_geo=1&lat=#{@lat}&lon=#{@long}&radius=20&is_getty=1&extras=geo%2Cowner_name%2C+url_l%2C&views%2C&format=json&nojsoncallback=1")
  end

  private
    attr_reader :conn

    def get_json(url)
      response ||= conn.get(url)
      JSON.parse(response.body, symbolize_names: true)[:photos][:photo]
    end
end
