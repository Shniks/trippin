class SearchController < ApplicationController
  def index
    # binding.pry
    check = "#{params[:street]}, #{params[:city]}, #{params[:state]}"
    # binding.pry
  end
end
