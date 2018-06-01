class Photo
  attr_reader :title, :owner, :latitude, :longitude, :url, :url_sq
  def initialize(raw_photo)
    @title      = raw_photo[:title]
    @owner      = raw_photo[:ownername]
    @latitude   = raw_photo[:latitude]
    @longitude  = raw_photo[:longitude]
    @url        = raw_photo[:url_l]
    @url_sq     = raw_photo[:url_sq]
  end
end
