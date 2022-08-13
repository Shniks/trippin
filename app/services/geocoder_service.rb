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
      geocoder ||= Geocoder.search(address).first
      is_address_valid?(geocoder)
    end

    def is_address_valid?(geocoder)
      if geocoder.nil?
        return { lat: 'error', lng: 'error' }
      else
        { "lat" => geocoder.data["lat"], "lng" => geocoder.data["lon"] }
      end
    end
end
