class ParkSearch
  # def parks
  #   raw_parks.map do |raw_park|
  #     Park.new(raw_park)
  #   end
  # end

  # private
    def raw_parks
      @raw_parks ||= ParkService.new.park_search
    end
end
