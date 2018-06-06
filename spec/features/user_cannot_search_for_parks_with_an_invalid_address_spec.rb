require 'rails_helper'
require './spec/fixtures/omniauth/omniauth_mock'

describe 'As a User' do
  describe 'I log into the app' do
    describe 'And I enter an incorrect street, city, state address into the search fields' do
      describe 'And I enter a radius in miles and click on submit' do
        scenario 'I get a flash message stating that I entered an invalid address' do
          VCR.use_cassette('invalid_address_entry') do
            create_list(:park, 10)

            stub_omniauth
            visit root_path

            within('.login-btn') do
              click_link 'Sign in with Google'
            end

            fill_in :street, with: 'sdfsf'
            fill_in :city, with: ''
            fill_in :state, with: 'cdf'
            fill_in :radius, with: 500

            click_on 'Submit'

            expect(current_path).to eq(search_path)
            expect(page).to have_content('You have entered an invalid address. Please re-enter a valid address.')
          end
        end
      end
    end
  end
end
