class ParkPresenter
  def initialize(params)
    @params = params
  end

  def parks_search
    found_parks
  end

  def current_location
    {lat: lat, long: long}
  end

  private
    def found_parks
      Park.geocoded_by(latitude: lat, longitude: long)
      Park.near([lat, long], @params[:radius])
    end

    def coordinates
      coordinates ||= GeocoderService.new(@params).coordinates
    end

    def lat
      coordinates["lat"]
    end

    def long
      coordinates["lng"]
    end
end
