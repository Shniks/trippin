class ParksController < ApplicationController
  before_action :require_login

  def index
    @parks = Park.parks_search(params)
    @current_location = Park.current_location
  end

  def show
    @park = Park.find(params[:id])
    @photos = FlickrPresenter.new(@park.latitude, @park.longitude).photos
  end
end
