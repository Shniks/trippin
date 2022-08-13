require 'rails_helper'

describe ParkService do
  subject { ParkService.new }

  it 'Exists' do
    expect(subject).to be_a ParkService
  end

  context 'Instance methods' do
    context '#park_search' do
      it 'returns an array of hashes with the park data' do
        VCR.use_cassette('park_data') do

          park = ParkService.new.park_search

          expect(park.count).to eq(468)
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
