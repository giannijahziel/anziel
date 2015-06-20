class JobAppsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@job = Job.find(params[:job_id])
		@new_jobapp = @job.job_apps.create(params.require(:job_app).permit(
			:email,
			:name,
			:resumelink,
			:linkedinprofile,
			:twitterlink,
			:weblink,
			:message
			))
		
		redirect_to job_path(@job)
		# flash.now[:notice] = "Your application was successfully sent (Y)"
	end


	# def new
	# 	@jobapp = current_user.job_apps.build
	# end


	def destroy
		@job = Job.find(params[:job_id])
		@jobapp = @job.job_apps.find(params[:id])
		@jobapp.destroy

		redirect_to job_path(@job)
		
	end

end
