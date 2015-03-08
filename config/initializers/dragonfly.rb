require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "ac9af53d8a1309578572aa93a11fdfa32b546338a88a2bd30be8418fcaaaf939"

  url_format "/media/:job/:basename"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')

  fetch_file_whitelist [ /images/ ]
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
