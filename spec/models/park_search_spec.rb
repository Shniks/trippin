require 'rails_helper'

describe ParkSearch do
  subject { ParkSearch.new }

  it 'Exists' do
    expect(subject).to be_a ParkSearch
  end

  context 'Instance methods' do
    context '#raw_parks' do
      it 'returns an array of hashes with the park data' do
        VCR.use_cassette('park_search_data') do

          park = subject.raw_parks
          
          expect(park.count).to eq(496)
          expect(park.first).to have_key(:states)
          expect(park.first).to have_key(:latLong)
          expect(park.first).to have_key(:description)
          expect(park.first).to have_key(:directionsInfo)
          expect(park.first).to have_key(:directionsUrl)
          expect(park.first).to have_key(:url)
          expect(park.first).to have_key(:fullName)
        end
      end
    end
  end
end
