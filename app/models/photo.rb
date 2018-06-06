class Photo
  attr_reader :title, :url
  def initialize(raw_photo)
    @title      = raw_photo[:title]
    @url        = raw_photo[:url_s]
  end
end
