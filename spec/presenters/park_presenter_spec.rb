require 'rails_helper'

describe ParkPresenter do
  it 'Finds parks near a location' do
    VCR.use_cassette('park_presenter_find_parks') do
      create(:park)
      params = {street: '1777 Wewatta Street',
                city: 'Denver',
                state: 'CO',
                radius: '150'
              }

      park = ParkPresenter.new(params).parks_search.first
      
      expect(park.state).to eq('Colorado')
      expect(park.description).to eq('Rocky Mountain National Park is the best park in Colorado')
      expect(park.full_name).to eq('Rocky Mountain National Park')
      expect(park.url).to eq('http://awesomerockymountains.com')
      expect(park.latitude).to eq(40.3428)
      expect(park.longitude).to eq(-105.6836)
    end
  end
end
