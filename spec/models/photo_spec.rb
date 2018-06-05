require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe 'Initialize' do
    it 'Creates a photo object' do
      info = { title: 'Awesome Image',
               ownername: 'Honeybooboo',
               latitude: '34.3456',
               longitude: '-115.4567',
               url_s: 'http://awesomerockymountains.com',
               url_sq: 'http://awesomerockymountains.com/sq'
              }

      photo = Photo.new(info)

      expect(photo.title).to eq('Awesome Image')
      expect(photo.owner).to eq('Honeybooboo')
      expect(photo.latitude).to eq('34.3456')
      expect(photo.longitude).to eq('-115.4567')
      expect(photo.url).to eq('http://awesomerockymountains.com')
      expect(photo.url_sq).to eq('http://awesomerockymountains.com/sq')
    end
  end
end
