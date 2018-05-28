require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
   it { should validate_presence_of(:name) }
   it { should validate_presence_of(:uid) }
   it { should validate_presence_of(:email) }
   it { should validate_presence_of(:oauth_token) }
 end

 describe 'Class Methods' do
   describe '.from_omniauth' do
     it 'creates or updates itself from an oauth hash' do
       auth_info = { "provider"=>"google_oauth2",
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
                    }
        User.from_omniauth(auth_info)
        user = User.first

        expect(user.uid).to eq('103746745442750564186')
        expect(user.name).to eq('Nikhil Shahi')
        expect(user.email).to eq('nikhil@nikhil.com')
        expect(user.oauth_token).to eq('QQya29.GlvJBeUXUKW26c8C7JyykvxYm5pTiJR-EEYh9Ej65vI-AVDSEtezwCr6dSHLPmRqRIu3DsDF-OD1fjzPXgZ7P4ZeNR_5AQHg9Js')
      end
   end
 end
end
