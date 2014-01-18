# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Portfolio::Application.initialize!

# Look for config.yml system defaults
APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")

