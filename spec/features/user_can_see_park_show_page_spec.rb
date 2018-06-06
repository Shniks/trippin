require 'rails_helper'
require './spec/fixtures/omniauth/omniauth_mock'

describe 'As a logged in User' do
  describe 'I enter my street, city, state address and search radius into the search fields and hit submit' do
    describe 'I click on a link to a park' do
      scenario 'I can see the details of that park' do
        VCR.use_cassette('park_show') do
          parks = create_list(:park, 1)
          park = parks.first

          stub_omniauth
          visit root_path

          within('.login-btn') do
            click_link 'Sign in with Google'
          end

          fill_in :street, with: '1777 Wewatta Street'
          fill_in :city, with: 'Denver'
          fill_in :state, with: 'Colorado'
          fill_in :radius, with: 500

          click_on 'Submit'
          click_on 'List View'

          click_on 'Rocky Mountain National Park, Colorado'

          expect(current_path).to eq(park_path(park))
          expect(page).to have_content('Rocky Mountain National Park, Colorado')
          expect(page).to have_content('Position: 40.3428, -105.6836')
        end
      end
    end
  end
end
