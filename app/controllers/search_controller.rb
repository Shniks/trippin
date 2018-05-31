class SearchController < ApplicationController
  def index
    unless params[:street].nil?
    # binding.pry
      address = "#{params[:street]}, #{params[:city]}, #{params[:state]}"
      lat = Geocoder.search(address).first.data["geometry"]["location"]["lat"]
      long = Geocoder.search(address).first.data["geometry"]["location"]["lng"]
      binding.pry
      @parks = Park.near([lat, long], params[:radius])
    end
  end
end
