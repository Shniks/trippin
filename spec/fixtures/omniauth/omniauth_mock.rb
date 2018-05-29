def stub_omniauth
  OmniAuth.config.test_mode = true
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
