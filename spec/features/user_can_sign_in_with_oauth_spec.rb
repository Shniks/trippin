require 'rails_helper'

describe 'As a User' do
  describe 'When I click on \'Sign in with Google\' on the homepage ' do
    scenario 'I get logged into the app and see my name and a logout link' do
      stub_omniauth

      visit root_path

      expect(page.status_code).to eq(200)
      expect(page).to have_link('Sign in with Google')

      click_link 'Sign in with Google'

      expect(current_path).to eq(search_path)
      expect(page).to have_content('Nikhil')
      expect(page).to have_link('Logout')
    end
  end
end

def stub_omniauth
  # Set OmniAuth to run in test mode
  OmniAuth.config.test_mode = true
  # Provide a set of fake oauth data that omniauth will use when a user tries to authenticate
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
                  "provider"=>"google_oauth2",
                  "uid"=>"103746745442750564186",
                  "info"=>
                   {"name"=>"Nikhil Shahi",
                    "email"=>"nikhil@nikhil.com",
                    "first_name"=>"Nikhil",
                    "last_name"=>"Shahi",
                    "image"=>
                     "https://lh5.googleusercontent.com/-QnXkBbmIURs/AAAAAAAAAAI/AAAAAAAABG8/HCK95bYYG_c/photo.jpg"},
                  "credentials"=>
                   {"token"=>
                     "QQya29.GlvJBeUXUKW26c8C7JyykvxYm5pTiJR-EEYh9Ej65vI-AVDSEtezwCr6dSHLPmRqRIu3DsDF-OD1fjzPXgZ7P4ZeNR_5AQHg9Js",
                    "expires_at"=>1527511552,
                    "expires"=>true}
  })
end
