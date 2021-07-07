# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'dox'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

Dir[Rails.root.join('spec/docs/**/*.rb')].each { |f| require f } # rubocop:disable Lint/NonDeterministicRequireOrder
RSpec.configure do |config|
  config.after(:each, :dox) do |example|
    example.metadata[:request] = request
    example.metadata[:response] = response
  end
end
# This last config is to specify which files are the ones which are going to be in charge to be associated with the created resource
Dox.configure do |config|
  config.header_file_path = Rails.root.join('spec/docs/descriptions/header.md')
  config.desc_folder_path = Rails.root.join('spec/docs/descriptions')
  config.headers_whitelist = ['Accept'] # rubocop:disable Naming/InclusiveLanguage
end

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
