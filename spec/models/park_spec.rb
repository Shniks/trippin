require 'rails_helper'

RSpec.describe Park, type: :model do
  describe 'Validations' do
    it{ is_expected.to validate_presence_of(:latitude) }
    it{ is_expected.to validate_presence_of(:longitude) }
    it{ is_expected.to validate_presence_of(:full_name) }
    it{ is_expected.to validate_presence_of(:url) }
  end

  describe 'Class Methods' do
    describe '.create_parks' do
      it 'Creates a park object' do
        info = { states: 'Colorado',
                 description: 'Rocky Mountain National Park',
                 directionsInfo: 'Go to Boulder and make a left to Estes Park',
                 directionsUrl: 'http://awesomerockymountains.com/directions',
                 fullName: 'Rocky Mountain National Park',
                 url: 'http://awesomerockymountains.com',
                 weather_info: 'Partly cloudy with a chance of shower',
                 latLong: 'lat:40.3428, long:-105.6836' }

        park = Park.create_parks(info)

        expect(park.state).to eq('Colorado')
        expect(park.latitude).to eq(40.3428)
        expect(park.longitude).to eq(-105.6836)
        expect(park.full_name).to eq('Rocky Mountain National Park')
      end
    end
  end

end
