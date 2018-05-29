require 'rails_helper'
require './spec/fixtures/omniauth/omniauth_mock'

describe 'As a User' do
  describe 'I log into the app' do
    describe 'And I enter my street, city, state address into the search fields' do
      describe 'And I select a radius in miles from a dropdown' do
        describe 'I get redirected to the parks index' do
          scenario 'I see my location on a map along with the national parks that fall within the specified radius' do
            stub_omniauth
            visit root_path

            click_link 'Sign in with Google'

            fill_in :street, with: '1777 Wewatta Street'
            fill_in :city, with: 'Denver'
            fill_in :state, with: 'Colorado'

            click_on 'Submit'

            expect(current_path).to eq(parks_path)
          end
        end
      end
    end
  end
end
