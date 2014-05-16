Library::Application.configure do
 # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false
  config.assets.initialize_on_precompile = false
  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true
  #config.action_mailer.default_url_options = { host =>'localhost',port:3000 }
  config.action_mailer.default_url_options = { host: 'localhost:3000' }
  
  config.action_mailer.delivery_method = :smtp
    config.action_mailer.delivery_method = :smtp
	config.action_mailer.smtp_settings = {
	  enable_starttls_auto: true,
	  address:'smtp.gmail.com',
	  port: 465,
	  tls: true,
	  domain:'google.com', #you can also use google.com
	  authentication: 'plain',
	  user_name: "nitbabar@gmail.com",
	  password: "lakeshore123"
	}
  
  config.secret_key = '781e411f9b20de1fb09f24a4858ffce9df2da5b7bd20c6533b6529b0bfce2af09826b53a44b63e45d49f564f0e338899277dbcced4ce827439e181eca29021b3'

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default :charset => "utf-8"

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5
  

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
end
