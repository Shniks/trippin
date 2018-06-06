class Photo
  attr_reader :title, :latitude, :longitude, :url
  def initialize(raw_photo)
    @title      = raw_photo[:title]
    @latitude   = raw_photo[:latitude]
    @longitude  = raw_photo[:longitude]
    @url        = raw_photo[:url_s]
  end
end
