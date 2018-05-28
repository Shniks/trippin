class User < ApplicationRecord
  validates_presence_of :name, :uid, :email, :oauth_token

  def self.from_omniauth(auth_info)
    if find_by(uid: auth_info[:uid])
      find_by(uid: auth_info[:uid]).update(oauth_token: auth_info[:credentials][:token])
    else
      create do |new_user|
        new_user.uid                = auth_info.uid
        new_user.first_name         = auth_info.info.first_name
        new_user.name               = auth_info.info.name
        new_user.email              = auth_info.info.email
        new_user.oauth_token        = auth_info.credentials.token
      end
    end
    find_by(uid: auth_info[:uid])
  end
end
