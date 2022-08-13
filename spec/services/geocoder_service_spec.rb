require 'rails_helper'

describe GeocoderService do
  params = {street: '1777 Wewatta Street',
            city: 'Denver',
            state: 'CO',
            radius: '150'
          }
  subject { GeocoderService.new(params) }

  it 'Exists' do
    expect(subject).to be_a GeocoderService
  end

  context 'Instance methods' do
    context '#coordinates' do
      it 'returns coordinates of the current location' do
        VCR.use_cassette('location_coordinates') do

          geocoder = GeocoderService.new(params).coordinates

          expect(geocoder["lat"]).to eq("39.75437973469388")
          expect(geocoder["lng"]).to eq("-105.0012236122449")
        end
      end
    end
  end
end
