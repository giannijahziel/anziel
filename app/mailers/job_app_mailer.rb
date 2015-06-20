class JobAppMailer < ApplicationMailer
	default to: "giannijahziel@gmail.com"

	def mandrill_client
		@mandrill_client ||= Mandrill::API.new MANDRILL_API_KEY
	end

	def new_jobapp(jobapp)
		@jobapp = jobapp
		# @job = Job.find(jobapp.job_id)
		# @poster = User.find(@job.user_id)
		# @poster = User.find(params[job.user_id])
		mail(to: @jobapp.job.user.email, subject: "New Job Application from: #{jobapp.name}")

		# Mailer View Information
		# <h4><%= @jobapp.name %></h4>
		# <h4><%= @jobapp.email %></h4>
		# <h4><%= @jobapp.resumelink %></h4>
		# <h4><%= @jobapp.linkedinprofile %></h4>
		# <h4><%= @jobapp.twitterlink %></h4>
		# <h4><%= @jobapp.weblink %></h4>
		# <h4><%= @jobapp.message %></h4>
		
	end

	def new_job(job)
		template_name = "new-job"
		template_content = []
		message = 
		{
			to: [{email: "giannijahziel@gmail.com"}],
			subject: "New Job: #{job.title}",
			merge_vars:
			[
				{
					rcpt: "giannijahziel@gmail.com",
					vars: 
					[
						{name: "JOB_TITLE", content: job.title}
					]
				}	
			]
		}

		mandrill_client.messages.send_template template_name, template_content, message
	end

end
