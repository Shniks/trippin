class User < ApplicationRecord
  validates_presence_of :name, :uid, :screen_name, :oauth_token

  def self.from_omniauth(auth_info)
    if find_by(uid: auth_info[:uid])
      find_by(uid: auth_info[:uid]).update(oauth_token: auth_info[:credentials][:token])
    else
      create do |new_user|
        new_user.uid                = auth_info.uid
        new_user.name               = auth_info.extra.raw_info.name
        new_user.screen_name        = auth_info.extra.raw_info.login
        new_user.oauth_token        = auth_info.credentials.token
      end
    end
    find_by(uid: auth_info[:uid])
  end
end
