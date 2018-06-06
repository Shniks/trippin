require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe 'Initialize' do
    it 'Creates a photo object' do
      info = { title: 'Awesome Image',
               latitude: '34.3456',
               longitude: '-115.4567',
               url_s: 'http://awesomerockymountains.com',
              }

      photo = Photo.new(info)

      expect(photo.title).to eq('Awesome Image')
      expect(photo.url).to eq('http://awesomerockymountains.com')
    end
  end
end
