require 'rails_helper'
require './spec/fixtures/omniauth/omniauth_mock'

describe 'As a User' do
  describe 'I log into the app' do
    describe 'And I enter my street, city, state address into the search fields' do
      describe 'And I enter a radius in miles and click on submit' do
        describe 'I get redirected to the parks index' do
          scenario 'I can see my location and a list of parks for my search params' do
            VCR.use_cassette('search_parks') do
              create(:park)
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

              expect(current_path).to eq(parks_path)
              expect(page).to have_content('1 National Parks found within 500 miles of your current location')
              expect(page).to have_content('Select a park from the map or list to continue...')
              expect(page).to have_css('.park', count: 1)
              within(first('.park')) do
                expect(page).to have_css('.park-name')
                expect(page).to have_content('Rocky Mountain National Park')
                expect(page).to have_css('.park-description')
                expect(page).to have_content('Rocky Mountain National Park is the best park in Colorado')
              end
            end
          end
        end
      end
    end
  end
end
