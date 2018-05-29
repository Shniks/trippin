require 'rails_helper'

describe 'As a User' do
  describe 'I log into the app' do
    describe 'And I enter my street, city, state address into the search fields' do
      describe 'And I select a radius in miles from a dropdown' do
        scenario 'I see my location on a map along with the national parks that fall within the specified radius' do
          visit root_path

          click_link 'Sign in with Google'

          fill_in :street
    end
