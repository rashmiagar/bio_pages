Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], { :access_type => 'offline', :hd => "cybrilla.com", :prompt => 'consent', :approval_prompt => 'force', :scope => 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile', :redirect_uri => "#{Rails.env.production? ? 'http://cyborg-skill-pages.herokuapp.com' : 'http://localhost:3000'}/auth/google_oauth2/callback"}
end