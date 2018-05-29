class Location < ApplicationRecord
  validates_presence_of :latitude, :longitude, :address
  attr_accessor     :address, :latitude, :longitude
  geocoded_by       :input_address
  after_validation  :geocode
  after_validation  :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def input_address(params = "")
    "#{params[:street]}, #{params[:city]}, #{params[:state]}"
  end

  # def address
  #   input_address(params)
  # end
end
