require 'rails_helper'

describe FlickrService do
  lat = 40.3428
  long = -105.6836
  subject { FlickrService.new(lat, long) }

  it 'Exists' do
    expect(subject).to be_a FlickrService
  end

  context 'Instance methods' do
    context '#photos_search' do
      it 'returns an array of hashes with the photos data' do
        VCR.use_cassette('flickr_data') do

          photos = FlickrService.new(lat, long).photos_search

          expect(photos.count).to eq(93)
          expect(photos.first).to have_key(:title)
          expect(photos.first).to have_key(:owner)
          expect(photos.first).to have_key(:latitude)
          expect(photos.first).to have_key(:longitude)
          expect(photos.first).to have_key(:url_l)
          expect(photos.first).to have_key(:url_sq)
        end
      end
    end
  end
end
