require 'rails_helper'

describe FlickrPresenter do
  it 'Converts json to a photo object' do
    VCR.use_cassette('flickr_presenter_photo_object') do
      lat = 40.3428
      long = -105.6836

      photos = FlickrPresenter.new(lat, long).photos

      expect(photos.first.title).to eq('Dream Lake, Colorado')
      expect(photos.first.url).to eq('https://farm6.staticflickr.com/5510/10528610585_90191a8cbe_m.jpg')
    end
  end
end
