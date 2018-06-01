class FlickrPresenter
  def initialize(lat, long)
    @lat    = lat
    @long   = long
  end

  def photos
    create_photo_objects
  end

  private
    def raw_photos
      raw_photos ||= FlickrService.new(@lat, @long).photos_search
    end

    def create_photo_objects
      raw_photos.map do |raw_photo|
        Photo.new(raw_photo) if raw_photo.keys.include?(:url_l)
      end.compact
    end
end
