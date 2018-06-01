class ParksController < ApplicationController
  def show
    @park = Park.find(params[:id])
    @photos = FlickrPresenter.new(@park.latitude, @park.longitude).photos
  end
end
