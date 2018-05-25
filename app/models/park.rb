class Park
  attr_reader :state, :description, :directions_info, :directions_url,
              :full_name, :url, :weather_info

  def initialize(attrs = {})
    @state            = attrs[:states]
    @latlong          = attrs[:latLong]
    @description      = attrs[:description]
    @directions_info  = attrs[:directionsInfo]
    @directions_url   = attrs[:directionsUrl]
    @full_name        = attrs[:fullName]
    @url              = attrs[:url]
    @weather_info     = attrs[:weatherInfo]
  end

  def latitude
    latlong.split(",")[0][4..-1]
  end

  def longitude
    latlong.split(",")[1][6..-1]
  end

  private
    attr_reader :latlong
end
