# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

# Settings for cors
# Origins can be specified as a string, a regular expression, or as ‘*’ to allow all origins.
# A Resource path can be specified as exact string match (/path/to/file.txt) or with a '' wildcard (`/all/files/in/`)
Rails.application.config.middleware.insert_before 0, "Rack::Cors" do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:post]
  end
end
