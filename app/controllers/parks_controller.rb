class ParksController < ApplicationController
  def index
    @parks = Park.parks_search(params)
  end

  def show
    @park = Park.find(params[:id])
    @photos = FlickrPresenter.new(@park.latitude, @park.longitude).photos
  end
end
