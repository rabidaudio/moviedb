class User < ActiveRecord::Base
  # include ActiveUUID::UUID
  # natural_key :email, :created_at

  has_many :viewings

  has_secure_password

  # TODO similar method for movie
  def self.from_omniauth(auth)
    puts auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
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

      #This is so in the future, if we add non-oauth logins, we know if they are setting their
      # password for the first time http://stackoverflow.com/questions/13188576/how-to-bypass-password-validation-in-the-following-omniauth-login-method
      user.user_password = false
      user.password = user.password_confirmation = SecureRandom.urlsafe_base64(n=20)
      user.save!
    end
  end

  #can't set an attribute with a question mark, so we make a helper accessor for it
  def user_password?
    user_password
  end

end
