class ParksController < ApplicationController
  def index
    location = Location.new(params)
    binding.pry
  end
end
