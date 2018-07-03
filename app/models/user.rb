class User < ApplicationRecord
  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    user_name = auth[:info][:name]
    key = auth[:credentials][:token]
    secret = auth[:credentials][:secret]

    current_user = User.find_by(provider: provider, uid: uid)
    if !current_user
      current_user = User.create!(
              provider: provider,
              uid: uid,
              name: user_name,
              key: key,
              secret: secret
      )
    end
    current_user
  end
end
