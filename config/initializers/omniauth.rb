Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['facebook_key'], ENV['facebook_secret']
    # callback_url: '/oauth/facebook',
    # scope: 'public_profile,email, user_actions.video'
end