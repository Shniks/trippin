class Photo
  attr_reader :title, :owner, :latitude, :longitude, :url
  def initialize(raw_photo)
    @title      = raw_photo[:title]
    @owner      = raw_photo[:ownername]
    @latitude   = raw_photo[:latitude]
    @longitude  = raw_photo[:longitude]
    @url        = raw_photo[:url_l]
  end
end
