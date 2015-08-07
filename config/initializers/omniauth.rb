Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], { :access_type => 'offline', :prompt => 'consent', :approval_prompt => 'force', :scope => 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar', :redirect_uri => 'http://localhost:3000/auth/google_oauth2/callback'}
end