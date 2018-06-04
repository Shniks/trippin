require 'rails_helper'
require './spec/fixtures/omniauth/omniauth_mock'

describe 'As a User' do
  describe 'I log into the app' do
    describe 'And I enter my street, city, state address into the search fields' do
      describe 'And I enter a radius in miles' do
        describe 'I get redirected to the parks index' do
          scenario 'I can see my location and a list of parks for my search params' do
            VCR.use_cassette('search_parks') do
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

              expect(current_path).to eq(parks_path)
              expect(page).to have_content('Your Current Location: 1777 Wewatta Street, Denver, Colorado')
              # Need to stub out geocoder
              # expect(page).to have_content('73 parks found within your selected range.')
              # expect(page).to have_css('.park', count: 73)
              # within(first('.park')) do
              #   expect(page).to have_css('.name')
              #   expect(page).to have_css('.state')
              #   expect(page).to have_css('.description')
              # end
            end
          end
        end
      end
    end
  end
end
