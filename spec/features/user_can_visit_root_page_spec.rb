require 'rails_helper'

describe 'As a User' do
  describe 'When I visit the root page' do
    scenario 'I can view the navbar contents with the sign in links' do
      visit root_path

      expect(page.status_code).to eq(200)

      within('.navbar') do
        expect(page).to have_link('Sign in with Google')
      end
    end
  end
end
