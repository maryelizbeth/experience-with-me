require 'capybara/rspec'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

Rspec.configure do |config| 

  config.mock_with :rspec

  config.use_transactional_fixtures = false 
  config.before (:suite) do 
    DatabaseCleaner.strategy = :truncation 
  end 

  config.before(:each) do 
    DatabaseCleaner.start
  end 

  config.after(:each) do 
    DatabaseCleaner.clean
  end 
end 