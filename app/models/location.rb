class Location < ApplicationRecord
  validates :address, :latitude, :longitude

  geocoded_by :address
  after_validation :geocode
end
