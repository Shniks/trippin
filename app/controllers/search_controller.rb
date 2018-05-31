class SearchController < ApplicationController
  def index
    unless params[:street].nil?
      @parks = Park.parks_search(params)
    end
  end
end
