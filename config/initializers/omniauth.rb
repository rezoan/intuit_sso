Rails.application.config.middleware.use OmniAuth::Builder do
  provider :open_id, :name => 'intuit', :identifier => 'https://openid.intuit.com/openid/xrds'
end
