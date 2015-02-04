class User < ActiveRecord::Base

  # TODO similar method for movie
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.firstname = auth.info.first_name
      user.email = auth.info.email
      user.image_url = auth.info.image
      user.gender = auth.extra.raw_info.gender
      user.locale = auth.extra.raw_info.locale
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

end
