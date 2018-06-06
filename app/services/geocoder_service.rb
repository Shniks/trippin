class GeocoderService
  def initialize(params)
    @params = params
  end

  def coordinates
    current_location_coordinates
  end

  private
    def address
      "#{@params[:street]}, #{@params[:city]}, #{@params[:state]}"
    end

    def current_location_coordinates
      Geocoder.search(address).first.data["geometry"]["location"]
    end
end
