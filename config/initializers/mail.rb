MANDRILL_API_KEY = "QcHgJnN7tNZZhh0EiBHQnQ"

ActionMailer::Base.smtp_settings = 
{

	address: "smtp.mandrillapp.com",
	port: 587,
	enable_starttls_auto: true,
	user_name: "planetanziel@gmail.com",
	password: MANDRILL_API_KEY,
	authentication: "login"

}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"