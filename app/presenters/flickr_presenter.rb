class FlickrPresenter
  def initialize(lat, long)
    @lat    = lat
    @long   = long
  end

  def photos
    raw_photos.map { |raw_photo| Photo.new(raw_photo) }
  end

  private
    def raw_photos
      raw_photos ||= FlickrService.new(@lat, @long).photos_search
    end
end
