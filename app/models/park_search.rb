class ParkSearch
    def raw_parks
      @raw_parks ||= ParkService.new.park_search
    end
end
