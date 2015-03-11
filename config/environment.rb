# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'mail'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
	:address        => 'smtp.sendgrid.net',
	:port           => '587',
	:authentication => :plain,
	:user_name      => ENV['SENDGRID_USERNAME'],
	:password       => ENV['SENDGRID_PASSWORD'],
	:domain         => 'heroku.com',
	:enable_starttls_auto => true
}

Mail.defaults do
	delivery_method :smtp, {
		:address => 'smtp.sendgrid.net',
		:port => '587',
		:domain => 'heroku.com',
		:user_name => ENV['SENDGRID_USERNAME'],
		:password => ENV['SENDGRID_PASSWORD'],
		:authentication => :plain,
		:enable_starttls_auto => true
	}
end

Mail.deliver do
	to 'example@example.com'
	from 'sender@example.comt'
	subject 'testing send mail'
	body 'Sending email with Ruby through SendGrid!'
end