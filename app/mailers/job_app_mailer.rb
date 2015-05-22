class JobAppMailer < ActionMailer::Base
	default from: "no-reply@anziel.com"
	default to: "giannijahziel@gmail.com"

	def new_jobapp(jobapp)
		@JobApp = jobapp
		mail(subject: "New Job Application: #{JobApp.name}")
	end

end
