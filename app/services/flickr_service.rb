class FlickrService
  def initialize(lat, long)
    @lat  = lat
    @long = long
    @conn = Faraday.new('https://api.flickr.com/services')
  end

  def photos_search
    get_json('rest')
  end

  private
    attr_reader :conn

    def get_json(url)
      response ||= conn.get(url, params)
      JSON.parse(response.body, symbolize_names: true)[:photos][:photo]
    end

    def params
      {
        method:         "flickr.photos.search",
        api_key:        ENV['FLICKR_KEY'],
        accuracy:       8,
        per_page:       500,
        has_geo:        1,
        lat:            "#{@lat}",
        lon:            "#{@long}",
        radius:         20,
        is_getty:       1,
        extras:         "url_s",
        format:         "json",
        nojsoncallback: 1
      }
    end
end
