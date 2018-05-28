require 'rails_helper'

describe 'As a User' do
  describe 'When I click on \'Sign in with Google\' on the homepage ' do
    scenario 'I get logged into the app and see my name and a logout link' do
      visit '/'

      expect(page.status_code).to eq(200)

      click_link 'Sign in with Google'

      expect(current_path).to eq(search_path)
      expect(page).to have_css('.welcome_profile')
      expect(page).to have_content('Nikhil')
      expect(page).to have_link('Logout')
    end
  end
end
