class ParksController < ApplicationController
  before_action :require_login

  def index
    park_presenter = ParkPresenter.new(params)
    @current_location ||= park_presenter.current_location
    if @current_location[:lat].nil? || @current_location[:lat].nil?
      flash[:failure] = 'You have entered an invalid address. Please re-enter a valid address.'
      redirect_to search_path
    else
      @parks = park_presenter.parks_search
    end
  end

  def show
    @park = Park.find(params[:id])
    @photos = FlickrPresenter.new(@park.latitude, @park.longitude).photos
  end
end
