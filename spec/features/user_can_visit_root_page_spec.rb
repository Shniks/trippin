require 'rails_helper'

describe 'As a User' do
  describe 'When I visit the root page' do
    scenario 'I can view the navbar contents with the register and login links' do
      visit root_path

      within('.navbar') do
        expect(page).to have_link('New User')
        expect(page).to have_link('Login')
      end
    end
  end
end
