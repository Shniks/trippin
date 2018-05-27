class Park < ApplicationRecord
  validates_presence_of :latitude, :longitude, :full_name, :url

  def self.create_parks(park)
    create do |new_park|
      new_park.state            = park[:states]
      new_park.description      = park[:description]
      new_park.directions_info  = park[:directionsInfo]
      new_park.directions_url   = park[:directionsUrl]
      new_park.full_name        = park[:fullName]
      new_park.url              = park[:url]
      new_park.weather_info     = park[:weatherInfo]
      new_park.latitude         = park[:latLong].split(",")[0][4..-1]
      new_park.longitude        = park[:latLong].split(",")[1][6..-1]
    end
  end
end
