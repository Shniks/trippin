require 'rails_helper'

describe FlickrPresenter do
  it 'Converts json to a photo object' do
    VCR.use_cassette('flickr_presenter_photo_object') do
      lat = 40.3428
      long = -105.6836

      photos = FlickrPresenter.new(lat, long).photos

      expect(photos.first.latitude).to eq('40.420847')
      expect(photos.first.longitude).to eq('-105.749373')
      expect(photos.first.owner).to eq('Jeffrey Sullivan')
      expect(photos.first.title).to eq('Bachelor Party')
      expect(photos.first.url).to eq('https://farm4.staticflickr.com/3177/2879660342_c7a76b62c7_b.jpg')
    end
  end
end
