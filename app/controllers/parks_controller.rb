class ParksController < ApplicationController
  before_action :require_login

  def index
    park_presenter = ParkPresenter.new(params)
    @parks = park_presenter.parks_search
    @current_location = park_presenter.current_location
  end

  def show
    @park = Park.find(params[:id])
    @photos = FlickrPresenter.new(@park.latitude, @park.longitude).photos
  end
end
